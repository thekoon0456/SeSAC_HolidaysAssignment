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
    
    private let backgroundView = UIImageView().then {
        $0.image = Const.BGImage.sunny.image
        $0.contentMode = .scaleAspectFill
        $0.alpha = 0.4
    }
    
    let cityLabel = OWFont.large(weight: .regular, alignment: .center).label
    let tempLabel = OWFont.mainTemp.label
    let weatherStateLabel = OWFont.regular.label
    let highTempLabel = OWFont.small.label
    let lowTempLabel = OWFont.small.label
    
    private let divider = UIView().then {
        $0.backgroundColor = .white
    }
    
    let threeHourCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 70, height: 160)
        layout.sectionInset = .init(top: 0, left: 20, bottom: 0, right: 0)
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero,
                                  collectionViewLayout: layout)
        cv.register(ThreeHourCell.self,
                    forCellWithReuseIdentifier: ThreeHourCell.identifier)
        cv.backgroundColor = .clear
        return cv
    }()
    
    let fiveDayTableView = UITableView().then {
        $0.register(FiveHourCell.self, forCellReuseIdentifier: FiveHourCell.identifier)
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.rowHeight = 46
        $0.isUserInteractionEnabled = false
    }
    let headerView = UIView()
    let detailWeatherCollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        
        let cv = UICollectionView(frame: .zero,
                                  collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    // MARK: - Helpers
    
    override func configureHierarchy() {
        addSubviews(backgroundView, scrollView)
        contentView.addSubviews(cityLabel, tempLabel, weatherStateLabel, highTempLabel, lowTempLabel, divider,
                                threeHourCollectionView, fiveDayTableView,
                                detailWeatherCollectionView)
    }
    
    override func configureLayout() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        cityLabel.snp.makeConstraints { make in
            make.top .equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(40)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }
        
        tempLabel.snp.makeConstraints { make in
            make.top.equalTo(cityLabel.snp.bottom).offset(4)
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
        
        highTempLabel.snp.makeConstraints { make in
            make.top.equalTo(weatherStateLabel.snp.bottom)
            make.trailing.equalTo(divider.snp.leading).offset(-12)
            make.height.equalTo(30)
        }
        
        divider.snp.makeConstraints { make in
            make.top.equalTo(highTempLabel.snp.top)
            make.width.equalTo(1)
            make.height.equalTo(highTempLabel.snp.height).multipliedBy(0.9)
            make.centerX.equalToSuperview()
        }
        
        lowTempLabel.snp.makeConstraints { make in
            make.top.equalTo(highTempLabel.snp.top)
            make.height.equalTo(highTempLabel.snp.height)
            make.leading.equalTo(divider.snp.trailing).offset(12)
        }
        
        threeHourCollectionView.snp.makeConstraints { make in
            make.top.equalTo(highTempLabel.snp.bottom).offset(40)
            make.horizontalEdges.equalToSuperview()
            make.centerX.equalToSuperview()
            make.height.equalTo(160)
        }
        
        fiveDayTableView.snp.makeConstraints { make in
            make.top.equalTo(threeHourCollectionView.snp.bottom).offset(40)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(230)
        }
        
        detailWeatherCollectionView.snp.makeConstraints { make in
            make.top.equalTo(fiveDayTableView.snp.bottom).offset(40)
            make.horizontalEdges.equalToSuperview().inset(20)
            make.centerX.equalToSuperview()
            make.height.equalTo(200)
            make.bottom.equalToSuperview()
        }
    }
    
    override func configureView() {
        
    }
}
