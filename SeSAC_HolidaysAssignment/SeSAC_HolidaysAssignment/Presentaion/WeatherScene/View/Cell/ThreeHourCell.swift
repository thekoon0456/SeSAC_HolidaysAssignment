//
//  ThreeHourCell.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/9/24.
//

import UIKit

import Kingfisher
import SnapKit

final class ThreeHourCell: BaseCollectionViewCell {
    
    //MARK: - Properties
    
    private var timeLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.textColor = .white
    }

    private var weatherIcon = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }

    private var tempLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 15)
        $0.textColor = .white
    }
    
    //MARK: - Helpers
    
    func configureCell(data: List?) {
        guard let data else { return }
        let formattedHour = DateFormatterManager.shared.formattedDate(input: data.dtTxt,
                                                                      inputFormat: .dtTxt,
                                                                      outputFormat: .hour)
        timeLabel.text = formattedHour
        tempLabel.text = Const.Temp.demical(temp: data.main.temp).value
        guard let icon = data.weather.first?.icon else { return }
        let url = URL(string: Router.icon(icon: icon).endPoint)
        weatherIcon.kf.setImage(with: url)
    }
    
    override func configureHierarchy() {
        contentView.addSubviews(timeLabel, weatherIcon, tempLabel)
    }
    
    override func configureLayout() {
        timeLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(4)
            make.bottom.equalTo(weatherIcon.snp.top).offset(8)
        }

        weatherIcon.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(50)
            make.width.equalToSuperview().inset(10)
        }
        
        tempLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(weatherIcon.snp.bottom).offset(8)
            make.bottom.equalToSuperview().offset(-4)
        }
    }
    
    override func configureView() {
        contentView.backgroundColor = .clear
    }
}
