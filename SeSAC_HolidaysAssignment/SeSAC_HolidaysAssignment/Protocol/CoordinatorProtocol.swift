//
//  CoordinatorProtocol.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/7/24.
//

import UIKit

enum CoordinatorType {
    case app
    case weather
    case search
    case map
}

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController? { get set }
    var type: CoordinatorType { get }
    
    func start()
    func removeChildCoordinator()
}

extension Coordinator {
    
    func removeChildCoordinator() {
        childCoordinators.removeAll()
    }
}
