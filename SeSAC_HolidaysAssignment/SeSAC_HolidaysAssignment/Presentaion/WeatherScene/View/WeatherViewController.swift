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
        
        viewModel.request()
        bindUI()
    }
    
    // MARK: - Helpers
    
    override func configureView() {
        weatherView.detailWeatherCollectionView.delegate = self
        weatherView.detailWeatherCollectionView.dataSource = self
        weatherView.threeHourCollectionView.delegate = self
        weatherView.threeHourCollectionView.dataSource = self
        weatherView.fiveDayTableView.delegate = self
        weatherView.fiveDayTableView.dataSource = self
    }
}

// MARK: - Bind

extension WeatherViewController {
    
    private func bindUI() {
        
        viewModel.city.bind { [weak self] city in
            guard let self else { return }
            weatherView.cityLabel.text = city
        }
        
        viewModel.temp.bind { [weak self] temp in
            guard let self else { return }
            weatherView.tempLabel.text = temp
        }
        
        viewModel.weatherState.bind { [weak self] state in
            guard let self else { return }
            weatherView.weatherStateLabel.text = state
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
        
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        return UICollectionViewCell()
    }
    
}
