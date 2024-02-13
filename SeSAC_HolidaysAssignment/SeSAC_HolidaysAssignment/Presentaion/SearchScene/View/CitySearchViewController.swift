//
//  CitySearchViewController.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/8/24.
//

import UIKit

final class CitySearchViewController: BaseViewController, VMViewController {
    
    // MARK: - Properties
    
    let viewModel: SearchViewModel
    var cityList: [City] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private let titleLabel = OWFont.large(weight: .bold, alignment: .left).label.then {
        $0.text = OWConst.Title.city.text
    }
    
    private lazy var searchBar = UISearchBar().then {
        $0.placeholder = "Search for a city"
        $0.barTintColor = .clear
        $0.searchTextField.backgroundColor = .secondarySystemFill
        $0.searchTextField.textColor = .white
        $0.tintColor = .white
        $0.delegate = self
    }
    
    private lazy var tableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.delegate = self
        $0.dataSource = self
        $0.rowHeight = UITableView.automaticDimension
        $0.register(CityListCell.self, forCellReuseIdentifier: CityListCell.identifier)
    }
    
    // MARK: - Lifecycles
    
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.parseJSON()
        bind()
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
            make.horizontalEdges.equalToSuperview()
            make.height.equalTo(50)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(searchBar.snp.bottom)
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    override func configureView() {
        view.backgroundColor = .black
    }
    
}

// MARK: - Bind

extension CitySearchViewController {

    func bind() {
        viewModel.cityList.bind { [weak self] city in
            guard let self else { return }
            cityList = city
        }
    }
}

// MARK: - SearchBar

extension CitySearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard let inputText = searchBar.text?.lowercased().trimmingCharacters(in: .whitespacesAndNewlines) else { return }
        let list = viewModel.cityList.currentValue
        
        switch inputText.isEmpty {
        case true:
            cityList = list
        case false:
            let searchList = list.filter { $0.name.lowercased().contains(inputText) }
            cityList = searchList
        }
    }
}

// MARK: - TableView

extension CitySearchViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cityList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CityListCell.identifier, for: indexPath) as? CityListCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(data: cityList[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDefaultsManager.shared.city = cityList[indexPath.row]
        LocationManager.shared.updateCity()
        viewModel.presentToastView(cityName: cityList[indexPath.row].name)
    }
}
