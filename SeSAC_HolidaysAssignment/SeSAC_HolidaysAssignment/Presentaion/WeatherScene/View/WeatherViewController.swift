//
//  WeatherViewController.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/7/24.
//

import UIKit

/*
 id: 1846266
 lat: 37.654165
 lon: 127.049696
 */

final class WeatherViewController: BaseViewController {
    
    // MARK: - Properties
    
    private let weatherView = WeatherView()
    
    private let viewModel: WeatherViewModel
    
    // MARK: - Lifecycles
    
    init(viewModel: WeatherViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func loadView() {
        super.loadView()
        self.view = weatherView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Helpers
    
    override func configureHierarchy() {
        
    }
    
    override func configureLayout() {
        
    }
    
    override func configureView() {
        view.backgroundColor = .green
    }
}
