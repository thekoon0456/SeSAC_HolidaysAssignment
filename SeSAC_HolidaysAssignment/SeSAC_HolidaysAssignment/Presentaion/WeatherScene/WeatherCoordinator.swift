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
    
    func presentLoadView() {
        let vc = LoadViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        navigationController?.present(vc, animated: false)
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self else { return }
            dismiss()
        }
    }
    
    func pushToSearchVC() {
        let vm = SearchViewModel(coordinator: self)
        let vc = CitySearchViewController(viewModel: vm)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func presentToastView(cityName: String) {
        //toast뷰 띄우기
        let vc = ToastViewController(cityName: cityName)
        vc.modalPresentationStyle = .overFullScreen
        vc.modalTransitionStyle = .crossDissolve
        navigationController?.present(vc, animated: true)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) { [weak self] in
            guard let self else { return }
            dismiss()
            pop()
        }
    }
    
    func dismiss() {
        navigationController?.dismiss(animated: true)
    }
    
    func pop() {
        navigationController?.popViewController(animated: true)
    }
}
