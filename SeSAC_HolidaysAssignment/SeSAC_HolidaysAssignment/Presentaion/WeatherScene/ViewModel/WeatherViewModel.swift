//
//  WeatherViewModel.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/7/24.
//

import Foundation

final class WeatherViewModel: ViewModel {
    
    weak var coordinator: WeatherCoordinator?
    
    init(coordinator: WeatherCoordinator? = nil) {
        self.coordinator = coordinator
    }
    
    
    
}
