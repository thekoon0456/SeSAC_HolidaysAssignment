//
//  WeatherViewController.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/7/24.
//

import UIKit

/*
 id: 1846266
 lat: 37.654165
 lon: 127.049696
 */

final class WeatherViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let weatherView = WeatherView()
    
    private let viewModel: WeatherViewModel
    
    // MARK: - Lifecycles
    
    init(viewModel: WeatherViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
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
        
        viewModel.request()
        viewModel.requestForecast()
    }
    
    // MARK: - Selectors
    
    @objc func listButtonTapped() {
        viewModel.coordinator?.pushToSearchVC()
    }
    
    // MARK: - Helpers
    
    override func configureView() {
        weatherView.detailWeatherCollectionView.delegate = self
        weatherView.detailWeatherCollectionView.dataSource = self
        weatherView.threeHourCollectionView.delegate = self
        weatherView.threeHourCollectionView.dataSource = self
        weatherView.fiveDayTableView.delegate = self
        weatherView.fiveDayTableView.dataSource = self
        
        navigationItem.backButtonDisplayMode = .minimal
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "list.bullet"),
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(listButtonTapped))
    }
}

// MARK: - Bind

extension WeatherViewController {
    
    private func bindUI() {
        viewModel.currentWeather.bind { weather in
            DispatchQueue.main.async { [weak self] in
                guard let self,
                      let main = weather.main
                else { return }
                
                weatherView.cityLabel.text = weather.name
                weatherView.tempLabel.text = Const.Temp.demical(temp: main.temp).value
                weatherView.weatherStateLabel.text = weather.weather?.first?.description
                weatherView.highTempLabel.text = Const.Temp.high.value + Const.Temp.demical(temp: main.tempMax).value
                weatherView.lowTempLabel.text = Const.Temp.low.value +  Const.Temp.demical(temp: main.tempMin).value
            }
        }
        
        viewModel.forecastWeather.bind { forecast in
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                weatherView.threeHourCollectionView.reloadData()
                weatherView.fiveDayTableView.reloadData()
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
              var list = viewModel.forecastWeather.currentValue.list
        else {
            return UITableViewCell()
        }
        let dateManager = DateFormatterManager.shared
        
        list = list.filter { weather in
            let day = dateManager.formattedDate(input: weather.dtTxt, inputFormat: .dtTxt, outputFormat: .hour)
            return day == Const.Time.twelve.value ? true : false
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
            return viewModel.forecastWeather.currentValue.list?.count ?? 0
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case weatherView.threeHourCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThreeHourCell.identifier, for: indexPath) as? ThreeHourCell else {
                return UICollectionViewCell()
            }
            
            cell.configureCell(data: viewModel.forecastWeather.currentValue.list?[indexPath.item])
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
}
