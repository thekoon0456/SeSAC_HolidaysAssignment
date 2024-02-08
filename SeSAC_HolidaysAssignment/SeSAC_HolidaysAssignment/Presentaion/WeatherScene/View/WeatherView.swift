//
//  WeatherView.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/8/24.
//

import UIKit

import SnapKit

final class WeatherView: BaseView {
    
    // MARK: - Properties
    
    private lazy var scrollView = UIScrollView().then {
        $0.addSubview(contentView)
    }
    private let contentView = UIView()
    
    private let titleLabel = UILabel()
    let tempLabel = UILabel()
    let weatherStateLabel = UILabel()
    let highTemp = UILabel()
    let lowTemp = UILabel()
    let divider = UIView()
    
    let threeHourCollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        
        let cv = UICollectionView(frame: .zero,
                                  collectionViewLayout: layout)
        return cv
    }()
    let fiveDayTableView = UITableView()
    
    let headerView = UIView()
    let detailWeatherCollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        
        let cv = UICollectionView(frame: .zero,
                                  collectionViewLayout: layout)
        return cv
    }()
    
    // MARK: - Helpers
    
    override func configureHierarchy() {
        addSubview(scrollView)
        contentView.addSubviews(titleLabel, tempLabel, weatherStateLabel, highTemp, lowTemp, divider,
                                threeHourCollectionView, fiveDayTableView,
                                detailWeatherCollectionView)
    }
    
    override func configureLayout() {
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top .equalToSuperview().offset(24)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }
        
        tempLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(80)
            make.centerX.equalToSuperview()
        }
        
        weatherStateLabel.snp.makeConstraints { make in
            make.top.equalTo(tempLabel.snp.bottom).offset(4)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(30)
            make.centerX.equalToSuperview()
        }
        
        highTemp.snp.makeConstraints { make in
            make.top.equalTo(weatherStateLabel.snp.bottom)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalTo(30)
            make.trailing.equalTo(divider.snp.leading).offset(-4)
        }
        
        divider.snp.makeConstraints { make in
            make.top.equalTo(highTemp.snp.top)
            make.width.equalTo(1)
            make.height.equalTo(highTemp.snp.height)
            make.centerX.equalToSuperview()
        }
        
        lowTemp.snp.makeConstraints { make in
            make.top.equalTo(highTemp.snp.top)
            make.width.equalToSuperview().multipliedBy(0.3)
            make.height.equalTo(highTemp.snp.height)
            make.leading.equalTo(divider.snp.trailing).offset(4)
        }
        
        threeHourCollectionView.snp.makeConstraints { make in
            make.top.equalTo(highTemp.snp.bottom).offset(40)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(160)
        }
        
        fiveDayTableView.snp.makeConstraints { make in
            make.top.equalTo(threeHourCollectionView.snp.bottom).offset(40)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(200)
        }
        
        detailWeatherCollectionView.snp.makeConstraints { make in
            make.top.equalTo(fiveDayTableView.snp.bottom).offset(40)
            make.horizontalEdges.equalToSuperview().inset(40)
            make.centerX.equalToSuperview()
            make.height.equalTo(200)
            make.bottom.equalToSuperview()
        }
    }
    
    override func configureView() {
        
    }
}
