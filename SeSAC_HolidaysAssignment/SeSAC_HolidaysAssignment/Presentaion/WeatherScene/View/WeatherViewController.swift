//
//  WeatherViewController.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/7/24.
//

import MapKit
import UIKit

final class WeatherViewController: BaseViewController, VMViewController {
    
    // MARK: - Properties
    
    let viewModel: WeatherViewModel
    private let weatherView: WeatherView
    
    // MARK: - Lifecycles
    
    init(viewModel: WeatherViewModel) {
        self.viewModel = viewModel
        weatherView = WeatherView()
        super.init()
    }
    
    override func loadView() {
        super.loadView()
        
        view = weatherView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.coordinator?.presentLoadView()
        bindUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setMapAnnotation()
        updateWeather()
    }
    
    // MARK: - Selectors
    
    @objc func mapButtonTapped() {
        viewModel.coordinator?.puchToMapVC()
    }
    
    @objc func listButtonTapped() {
        viewModel.coordinator?.pushToSearchVC()
    }
    
    // MARK: - Helpers
    
    func updateWeather() {
        let group = DispatchGroup()
        
        group.enter()
        viewModel.requestWeather {
            group.leave()
        }
        
        group.enter()
        viewModel.requestForecast {
            group.leave()
        }

        group.notify(queue: .main) { [weak self] in
            guard let self else { return }
            viewModel.coordinator?.dismiss()
        }
    }
    
    override func configureView() {
        weatherView.detailWeatherCollectionView.delegate = self
        weatherView.detailWeatherCollectionView.dataSource = self
        weatherView.threeHourCollectionView.delegate = self
        weatherView.threeHourCollectionView.dataSource = self
        weatherView.fiveDayTableView.delegate = self
        weatherView.fiveDayTableView.dataSource = self
        navigationItem.backButtonDisplayMode = .minimal
        setButtons()
        setRefreshControl()
        setMapViewGesture()
    }
}

// MARK: - Bind

extension WeatherViewController {
    
    private func bindUI() {
        viewModel.currentWeather.bind { weather in
            DispatchQueue.main.async { [weak self] in
                guard let self,
                      let weather,
                      let main = weather.main
                else { return }
                weatherView.cityLabel.text = weather.name
                weatherView.tempLabel.text = OWConst.Temp.demical(temp: main.temp).value
                weatherView.weatherStateLabel.text = weather.weather?.first?.description
                weatherView.highTempLabel.text = OWConst.Temp.high.value
                + OWConst.Temp.demical(temp: main.tempMax).value
                weatherView.lowTempLabel.text = OWConst.Temp.low.value
                +  OWConst.Temp.demical(temp: main.tempMin).value
            }
        }
        
        viewModel.forecastWeather.bind { forecast in
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                weatherView.threeHourCollectionView.reloadData()
                weatherView.fiveDayTableView.reloadData()
            }
        }
        
        viewModel.detailWeather.bind { detailWeather in
            DispatchQueue.main.async {  [weak self] in
                guard let self else { return }
                weatherView.detailWeatherCollectionView.reloadData()
            }
        }
    }
}

// MARK: - TableView

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FiveHourCell.identifier, for: indexPath) as? FiveHourCell,
              var list = viewModel.forecastWeather.currentValue?.list
        else {
            return UITableViewCell()
        }
        
        let dateManager = DateFormatterManager.shared
        
        list = list.filter { weather in
            let day = dateManager.formattedDate(input: weather.dtTxt, inputFormat: .dtTxt, outputFormat: .hour)
            return day == OWConst.Time.twelve.value ? true : false
        }
        
        cell.configureCell(data: list[indexPath.item])
        return cell
    }
    
}

// MARK: - CollectionView

extension WeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case weatherView.threeHourCollectionView:
            guard let forecastWeatherList = viewModel.forecastWeather.currentValue?.list else { return 0 }
            return forecastWeatherList.count
            
        case weatherView.detailWeatherCollectionView:
            guard let detailWeather = viewModel.detailWeather.currentValue else { return 0 }
            return detailWeather.count
            
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case weatherView.threeHourCollectionView:
            guard let forecastWeatherList = viewModel.forecastWeather.currentValue?.list,
                  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThreeHourCell.identifier, for: indexPath) as? ThreeHourCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(data: forecastWeatherList[indexPath.item])
            return cell
            
        case weatherView.detailWeatherCollectionView:
            guard let detailWeather = viewModel.detailWeather.currentValue,
                  let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailWeatherCell.identifier, for: indexPath) as? DetailWeatherCell else {
                return UICollectionViewCell()
            }
            cell.configureCell(data: detailWeather[indexPath.item])
            return cell
            
        default:
            return UICollectionViewCell()
        }
    }
    
}

// MARK: - Refrech

extension WeatherViewController {
    
    func setRefreshControl() {
        weatherView.refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    @objc func refreshData() {
        let group = DispatchGroup()
        
        group.enter()
        viewModel.requestWeather {
            group.leave()
        }
        
        group.enter()
        viewModel.requestForecast {
            group.leave()
        }
        
        group.notify(queue: .main) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
                guard let self else { return }
                weatherView.refreshControl.endRefreshing()
            }
        }
    }
}

// MARK: - Configure

extension WeatherViewController {
    
    func setButtons() {
        weatherView.mapButton.addTarget(self, action: #selector(mapButtonTapped), for: .touchUpInside)
        weatherView.listButton.addTarget(self, action: #selector(listButtonTapped), for: .touchUpInside)
    }
    
    func setMapAnnotation() {
        let locationManager = LocationManager.shared
        
        locationManager.getPlacemark(location: locationManager.location) { [weak self] locality, country in
            guard let self else { return }
            locationManager.setAnnotation(mapView: weatherView.mapView,
                                          coordinate: locationManager.coordinate,
                                          title: locality,
                                          subTitle: OWConst.Title.currentLocation.text)
        }
    }
    
    func setMapViewGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(mapViewTapped))
        weatherView.mapView.addGestureRecognizer(tap)
    }
    
    @objc func mapViewTapped() {
        viewModel.coordinator?.puchToMapVC()
    }
}
