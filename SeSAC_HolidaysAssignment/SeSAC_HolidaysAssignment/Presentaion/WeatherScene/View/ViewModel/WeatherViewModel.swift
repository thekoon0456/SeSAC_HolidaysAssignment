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
    var currentWeather: Observable<CurrentWeather?> = Observable(nil)
    var forecastWeather: Observable<Forecast?> = Observable(nil)
    var detailWeather: Observable<[DetailWeather]?> = Observable(nil)
    
    // MARK: - Lifecycles
    
    init(coordinator: WeatherCoordinator?) {
        self.coordinator = coordinator
    }
    
    // MARK: - Helpers
    
    func requestWeather() {
        let coord = UserDefaultsManager.shared.city.coord
        
        APIManager.shared.requestAPI(api: .locationWeather(lat: coord.lat, lon: coord.lon), type: CurrentWeather.self) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(var success):
                currentWeather.onNext(success)
                detailWeather.onNext(success.detailWeather)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func requestForecast() {
        let coord = UserDefaultsManager.shared.city.coord
        
        APIManager.shared.requestAPI(api: .locationForecast(lat: coord.lat, lon: coord.lon), type: Forecast.self) { [weak self] result in
            guard let self else { return }

            switch result {
            case .success(let success):
                forecastWeather.onNext(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
