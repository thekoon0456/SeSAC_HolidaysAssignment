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
    var cityList: [City]?
    
    // MARK: - Lifecycles
    
    init(coordinator: WeatherCoordinator?) {
        self.coordinator = coordinator
    }
    
    // MARK: - Helpers
    
    func parseJSON(){
        let decoder = JSONParser()
        guard let data = decoder.readJSON(name: Const.JSON.cityList.fileName) else { return }
        decoder.parseData(type: CityList.self, data: data) { result in
            switch result {
            case .success(let success):
                print(success.cityResult)
                self.cityList = success.cityResult
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
