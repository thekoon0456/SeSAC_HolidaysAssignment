//
//  SearchViewModel.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/8/24.
//

import Foundation

final class SearchViewModel: ViewModel {
    
    // MARK: - Properties
    
    weak var coordinator: WeatherCoordinator?
    var cityList: Observable<[City]> = Observable([])
    
    // MARK: - Lifecycles
    
    init(coordinator: WeatherCoordinator?) {
        self.coordinator = coordinator
    }
    
    // MARK: - Helpers
    
    func parseJSON() {
        let decoder = JSONParser()
        let data = decoder.readJSON(name: Const.JSON.cityList.fileName)
        
        decoder.parseData(type: [City].self, data: data) { result in
            switch result {
            case .success(let success):
                cityList.onNext(success)
            case .failure(let failure):
                print(failure)
            }
        }
    }
    
    func presentToastView(cityName: String) {
        coordinator?.presentToastView(cityName: cityName)
    }
}
