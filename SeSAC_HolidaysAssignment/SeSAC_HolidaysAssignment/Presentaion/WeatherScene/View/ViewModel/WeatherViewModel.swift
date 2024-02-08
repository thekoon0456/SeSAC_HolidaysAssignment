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
    let location = LocationManager.shared
    var currentWeather: Observable<CurrentWeather> = Observable(CurrentWeather.defaultModel)
    var forecastWeather: Observable<Forecast> = Observable(Forecast.defaultModel)
    
    // MARK: - Lifecycles
    
    init(coordinator: WeatherCoordinator?) {
        self.coordinator = coordinator
    }
    
    // MARK: - Helpers
    
    func request() {
        
//        APIManager.shared.requestAPI(api: .cityForecast(id: 1846266), type: Forecast.self) { result in
//            switch result {
//            case .success(let success):
//                print(success)
//            case .failure(let failure):
//                print(failure)
//            }
//        }
        
        APIManager.shared.requestAPI(api: .locationWeather(lat: location.lat, lon: location.lon), type: CurrentWeather.self) { result in
            switch result {
            case .success(let success):
                self.currentWeather.onNext(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func requestForecast() {
        APIManager.shared.requestAPI(api: .locationForecast(lat: location.lat, lon: location.lon), type: Forecast.self) { result in
            switch result {
            case .success(let success):
                print(success)
                self.forecastWeather.onNext(success)
            case .failure(let failure):
                print(failure)
            }
        }
        
    }
    
}
