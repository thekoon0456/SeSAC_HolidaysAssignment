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
    
    private let viewModel: WeatherViewModel
    
    init(viewModel: WeatherViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIManager.shared.requestAPI(api: .cityForecast(id: 1846266), type: Forecast.self) { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
        
        APIManager.shared.requestAPI(api: .locationForecast(lat: 37.654165, lon: 127.049696), type: Forecast.self) { result in
            switch result {
            case .success(let success):
                print(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    override func configureHierarchy() {
        
    }
    
    override func configureLayout() {
        
    }
    
    override func configureView() {
        view.backgroundColor = .green
    }
    
}
