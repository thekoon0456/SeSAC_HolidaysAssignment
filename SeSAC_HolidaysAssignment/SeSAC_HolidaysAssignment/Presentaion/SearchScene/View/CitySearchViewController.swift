//
//  CitySearchViewController.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/8/24.
//

import UIKit

final class CitySearchViewController: BaseViewController {
    
    // MARK: - Properties
    
    let viewModel: SearchViewModel
    
    private let titleLabel = OWFont.large(weight: .bold, alignment: .left).label.then {
        $0.text = Const.Title.city.text
    }
    
    private let searchBar = UISearchBar().then {
        $0.placeholder = "Search for a city"
        $0.backgroundColor = .clear
        $0.searchTextField.backgroundColor = .secondarySystemBackground
        $0.tintColor = .white
    }
    
    private lazy var tableView = UITableView().then {
        $0.delegate = self
        $0.dataSource = self
        $0.rowHeight = UITableView.automaticDimension
//        $0.register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: <#T##String#>)
        
    }
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.parseJSON()
//        print(viewModel.cityList)
    }
    
    // MARK: - Helpers
    
    override func configureHierarchy() {
        view.addSubviews(titleLabel, searchBar, tableView)
    }
    
    override func configureLayout() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview().offset(4)
        }
        
        searchBar.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().offset(8)
            make.height.equalTo(50)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.horizontalEdges.equalToSuperview().offset(8)
            make.bottom.equalToSuperview()
        }
    }
    
    override func configureView() {
        
    }
    
}

// MARK: - SearchBar

extension CitySearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
    }
    
}

// MARK: - TableView

extension CitySearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return UITableViewCell()
    }
    
    
}
