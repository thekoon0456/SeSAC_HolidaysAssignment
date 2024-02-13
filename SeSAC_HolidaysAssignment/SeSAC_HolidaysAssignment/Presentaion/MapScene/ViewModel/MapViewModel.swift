//
//  MapViewModel.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/13/24.
//

import Foundation

final class MapViewModel: ViewModel {
    
    // MARK: - Properties
    
    weak var coordinator: WeatherCoordinator?
    
    // MARK: - Lifecycles
    
    init(coordinator: WeatherCoordinator?) {
        self.coordinator = coordinator
    }
    
    
    
}
