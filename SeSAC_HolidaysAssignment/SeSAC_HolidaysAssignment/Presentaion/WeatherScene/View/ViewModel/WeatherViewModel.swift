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
    
    func requestWeather(completion: @escaping () -> Void) {
        let coord = UserDefaultsManager.shared.city.coord
        
        APIManager.shared.requestAPI(api: .locationWeather(lat: coord.lat, lon: coord.lon), type: CurrentWeather.self) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(var success):
                currentWeather.onNext(success)
                detailWeather.onNext(success.detailWeather)
                completion()
            case .failure(let failure):
                DispatchQueue.main.async {  [weak self] in
                    guard let self else { return }
                    coordinator?.showAlert(title: failure.title,
                                           message: failure.description,
                                           primaryButtonTitle: OWConst.Ment.retry.text,
                                           cancleButtonTitle: OWConst.Ment.ok.text,
                                           primaryAction: { [weak self] _ in
                        guard let self else { return }
                        requestForecast { }
                    }, cancleAction: { [weak self] _ in
                        guard let self else { return }
                        coordinator?.dismiss()
                    })
                }
                
            }
        }
    }
    
    func requestForecast(completion: @escaping () -> Void) {
        let coord = UserDefaultsManager.shared.city.coord
        
        APIManager.shared.requestAPI(api: .locationForecast(lat: coord.lat, lon: coord.lon), type: Forecast.self) { [weak self] result in
            guard let self else { return }
            
            switch result {
            case .success(let success):
                forecastWeather.onNext(success)
                completion()
            case .failure(let failure):
                DispatchQueue.main.async {  [weak self] in
                    guard let self else { return }
                    coordinator?.showAlert(title: failure.title,
                                           message: failure.description,
                                           primaryButtonTitle: OWConst.Ment.retry.text,
                                           cancleButtonTitle: OWConst.Ment.ok.text,
                                           primaryAction: { [weak self] _ in
                        guard let self else { return }
                        requestForecast { }
                    }, cancleAction: { [weak self] _ in
                        guard let self else { return }
                        coordinator?.dismiss()
                    })
                }
            }
        }
    }
}
