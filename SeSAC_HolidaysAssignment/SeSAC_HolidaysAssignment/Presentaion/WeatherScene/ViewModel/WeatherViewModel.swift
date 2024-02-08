//
//  WeatherViewModel.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/7/24.
//

import Foundation

final class WeatherViewModel: ViewModel {
    
    // MARK: - Properties
    
    weak var coordinator: WeatherCoordinator?
    let city = Observable("Jeju City")
    let temp = Observable("5.9°")
    let weatherState = Observable("Broken Clouds")
    let highTemp = Observable("최고: 7.0°")
    let lowTemp = Observable("최저: -4.2°")
    
    
    // MARK: - Lifecycles
    
    init(coordinator: WeatherCoordinator? = nil) {
        self.coordinator = coordinator
    }
    
    // MARK: - Helpers
    
    func request() {
        
//        APIManager.shared.requestAPI(api: <#T##Router#>, type: <#T##Decodable.Protocol#>) { <#Result<Decodable, WeatherError>#> in
//            <#code#>
//        }
    }
    
}
