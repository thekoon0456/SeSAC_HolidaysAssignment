//
//  WeatherCoordinator.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/7/24.
//

import UIKit

final class WeatherCoordinator: Coordinator {

    // MARK: - Properties
    
    var navigationController: UINavigationController?
    var childCoordinators: [Coordinator]
    var type: CoordinatorType
    
    // MARK: - Lifecycles
    
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
        self.childCoordinators = []
        self.type = .weather
    }
    
    deinit {
        print("WeatherCoordinator 해제")
    }
    
    // MARK: - Helpers
    
    func start() {
        let vm = WeatherViewModel(coordinator: self)
        let vc = WeatherViewController(viewModel: vm)
        
        navigationController?.pushViewController(vc, animated: true)
    }
}
