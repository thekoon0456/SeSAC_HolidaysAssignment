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
                guard let self else { return }
                weatherView.cityLabel.text = weather.name
                weatherView.tempLabel.text = String(format: "%.1f", (weather.main?.temp ?? 0) - 273.15)
                weatherView.weatherStateLabel.text = weather.weather?.first?.description
                weatherView.highTempLabel.text = "최고: " + String(format: "%.1f", (weather.main?.tempMax ?? 0) - 273.15) + "°"
                weatherView.lowTempLabel.text = "최저: " +  String(format: "%.1f", (weather.main?.tempMin ?? 0) - 273.15) + "°"
            }
        }
        
        viewModel.forecastWeather.bind { forecast in
            DispatchQueue.main.async { [weak self] in
                guard let self else { return }
                weatherView.threeHourCollectionView.reloadData()
            }
        }
    }
}

// MARK: - TableView

extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
}

// MARK: - CollectionView

extension WeatherViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case weatherView.threeHourCollectionView:
            return viewModel.forecastWeather.value.list?.count ?? 0
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
            
            viewModel.forecastWeather.bind { forecast in
                cell.configureCell(data: forecast.list?[indexPath.item])
            }
            
            return cell
        default:
            return UICollectionViewCell()
        }
    }
    
}
