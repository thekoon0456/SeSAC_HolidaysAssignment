//
//  FiveHourCell.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/9/24.
//

import UIKit

import Kingfisher
import SnapKit

final class FiveHourCell: BaseTableViewCell {
    
    private var dayLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 25)
        $0.textColor = .white
        $0.textAlignment = .left
    }

    private var weatherIcon = UIImageView().then {
        $0.contentMode = .scaleAspectFill
    }

    private var lowTempLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 25)
        $0.textColor = .systemGray
        $0.textAlignment = .left
    }
    
    private var highTempLabel = UILabel().then {
        $0.font = UIFont.systemFont(ofSize: 25)
        $0.textColor = .white
        $0.textAlignment = .right
    }
    
    func configureCell(data: List?) {
        guard let data else { return }
        let formattedDay = DateFormatterManager.shared.formattedDate(input: data.dtTxt,
                                                                     inputFormat: .dtTxt,
                                                                      outputFormat: .day)
//        dayLabel.text = formattedHour
//        tempLabel.text = String(format: "%.1f", data.main.temp - 273.15) + "°"
        guard let icon = data.weather.first?.icon else { return }
        let url = URL(string: Router.icon(icon: icon).endPoint)

        dayLabel.text = formattedDay
        weatherIcon.kf.setImage(with: url)
        lowTempLabel.text = "최저 " + Const.Temp.normal(temp: data.main.tempMin).value
        highTempLabel.text = "최고 " + Const.Temp.normal(temp: data.main.tempMax).value
    }
    
    override func configureHierarchy() {
        contentView.addSubviews(dayLabel, weatherIcon, lowTempLabel, highTempLabel)
    }
    
    override func configureLayout() {
        dayLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(8)
            make.width.equalTo(60)
        }

        weatherIcon.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.size.equalTo(30)
            make.top.equalToSuperview().offset(8)
            make.leading.equalTo(dayLabel.snp.trailing).offset(8)
            make.bottom.equalToSuperview().offset(-8)
        }
        
        lowTempLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(weatherIcon.snp.trailing).offset(12)
            make.width.equalTo(140)
        }
        
        highTempLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(lowTempLabel.snp.trailing).offset(4)
            make.trailing.equalToSuperview().offset(-8)
            make.width.equalTo(lowTempLabel.snp.width)
        }
    }
    
    override func configureView() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
    }
}
