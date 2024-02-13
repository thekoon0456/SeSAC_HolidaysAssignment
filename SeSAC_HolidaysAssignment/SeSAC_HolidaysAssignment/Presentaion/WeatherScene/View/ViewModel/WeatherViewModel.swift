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
//    private let location = LocationManager.shared
    var currentWeather: Observable<CurrentWeather?> = Observable(nil)
    var forecastWeather: Observable<Forecast?> = Observable(nil)
    var detailWeather: Observable<[DetailWeather]?> = Observable(nil)
    
    // MARK: - Lifecycles
    
    init(coordinator: WeatherCoordinator?) {
        self.coordinator = coordinator
    }
    
    // MARK: - Helpers
    
    func requestWeather() {
        let city = UserDefaultsManager.shared.city
        
        APIManager.shared.requestAPI(api: .locationWeather(lat: city.coord.lat, lon: city.coord.lon), type: CurrentWeather.self) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let success):
                currentWeather.onNext(success)
                detailWeather.onNext(setDetailWeather(success))
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func requestForecast() {
        let city = UserDefaultsManager.shared.city
        
        APIManager.shared.requestAPI(api: .locationForecast(lat: city.coord.lat, lon: city.coord.lon), type: Forecast.self) { [weak self] result in
            guard let self else { return }

            switch result {
            case .success(let success):
                forecastWeather.onNext(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    
    private func setDetailWeather(_ input: CurrentWeather) -> [DetailWeather] {
        var arr: [DetailWeather] = []
        let wind = DetailWeather(type: .wind, image: "wind", title: "바람 속도", value: String(input.wind?.speed ?? 0) + "m/s")
        arr.append(wind)
        let cloud = DetailWeather(type: .cloud, image: "cloud", title: "구름", value: String(input.clouds?.all ?? 0) + "%")
        arr.append(cloud)
        let pressure = DetailWeather(type: .pressure, image: "thermometer.medium", title: "기압", value: String(input.main?.pressure ?? 0) + "hpa")
        arr.append(pressure)
        let humidity = DetailWeather(type: .humidity, image: "humidity", title: "습도", value: String(input.main?.humidity ?? 0) + "%")
        arr.append(humidity)
        return arr
    }
}
