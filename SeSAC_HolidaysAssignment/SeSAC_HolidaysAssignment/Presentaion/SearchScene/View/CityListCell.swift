//
//  CityListCell.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/8/24.
//

import UIKit

import SnapKit

final class CityListCell: BaseTableViewCell {
    
    // MARK: - Properties
    
    let cityLabel = OWLabel(size: 16)
    let countryLabel = OWLabel(size: 12, color: .systemGray)
    
    // MARK: - Helpers
    
    func configureCell(data: City) {
        cityLabel.text = "# \(data.name)"
        countryLabel.text = data.country
    }
    
    override func configureHierarchy() {
        contentView.addSubviews(cityLabel, countryLabel)
    }
    
    override func configureLayout() {
        cityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(4)
            make.leading.equalToSuperview().offset(12)
        }
        
        countryLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom).offset(4)
            make.leading.equalToSuperview().offset(24)
            make.bottom.equalToSuperview().offset(-4)
        }
    }
    
    override func configureView() {
        contentView.backgroundColor = .black
    }
}
