//
//  AppCoordinator.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/7/24.
//

import UIKit

final class AppCoordinator: Coordinator {

    // MARK: - Properties
    
    var navigationController: UINavigationController?
    var childCoordinators: [Coordinator]
    var type: CoordinatorType
    
    init(navigationController: UINavigationController? = nil) {
        self.navigationController = navigationController
        self.childCoordinators = []
        self.type = .app
    }
    
    // MARK: - Helpers
    
    func start() {
        let coordinator = WeatherCoordinator(navigationController: navigationController)
        childCoordinators.append(coordinator)
        coordinator.start()
    }
}
