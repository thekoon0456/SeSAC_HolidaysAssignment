//
//  DetailWeatherCell.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/9/24.
//

import UIKit

import SnapKit

final class DetailWeatherCell: BaseCollectionViewCell {
    
    // MARK: - Properties
    
    private let bgView = UIView().then {
        $0.backgroundColor = .black
        $0.alpha = 0.1
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
    }
    
    private let icon = UIImageView().then {
        $0.contentMode = .scaleAspectFill
        $0.tintColor = .systemGray
    }
    private let titleLabel = OWFont.little.label.then {
        $0.textColor = .systemGray
    }
    
    private let valueLabel = OWFont.large(weight: .regular, alignment: .left).label
    
    // MARK: - Helpers
    
    func configureCell(data: DetailWeather) {
        icon.image = UIImage(systemName: data.image)
        titleLabel.text = data.title
        valueLabel.text = data.value
    }
    
    override func configureHierarchy() {
        contentView.addSubviews(bgView, icon, titleLabel, valueLabel)
    }
    
    override func configureLayout() {
        bgView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        icon.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(8)
            make.size.equalTo(20)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.leading.equalTo(icon.snp.trailing).offset(8)
            make.height.equalTo(20)
        }
        
        valueLabel.snp.makeConstraints { make in
            make.top.equalTo(icon.snp.bottom).offset(8)
            make.leading.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().offset(-8)
            make.centerX.equalToSuperview()
        }
    }
    
    override func configureView() {
        backgroundColor = .clear
    }
}
