//
//  WeatherView.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/8/24.
//

import UIKit
import MapKit

import SnapKit

final class WeatherView: BaseView {
    
    // MARK: - Properties
    
    private lazy var scrollView = UIScrollView().then {
        $0.showsVerticalScrollIndicator = false
        $0.addSubview(contentView)
        $0.refreshControl = refreshControl
    }
    
    let refreshControl = UIRefreshControl().then {
        $0.tintColor = .white
    }
    private let contentView = UIView()
    
    private let backgroundView = UIImageView().then {
        $0.image = OWConst.BGImage.sunny.image
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
    
    private lazy var threeHourHeaderView = OWHeaderView(type: .threeHour).then {
        $0.addSubview(threeHourCollectionView)
        let divider = $0.divider
        
        threeHourCollectionView.snp.makeConstraints { make in
            make.top.equalTo(divider.snp.bottom).offset(12)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    let threeHourCollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: 70, height: 160)
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero,
                                  collectionViewLayout: layout)
        cv.register(ThreeHourCell.self,
                    forCellWithReuseIdentifier: ThreeHourCell.identifier)
        cv.backgroundColor = .clear
        return cv
    }()
    
    private lazy var fiveDayHeaderView = OWHeaderView(type: .fiveDays).then {
        $0.addSubview(fiveDayTableView)
        let divider = $0.divider
        
        fiveDayTableView.snp.makeConstraints { make in
            make.top.equalTo(divider.snp.bottom).offset(12)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    let fiveDayTableView = UITableView().then {
        $0.register(FiveHourCell.self, forCellReuseIdentifier: FiveHourCell.identifier)
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.rowHeight = UITableView.automaticDimension
        $0.isUserInteractionEnabled = false
        $0.backgroundColor = .clear
    }
    
    private lazy var locationHeaderView = OWHeaderView(type: .location).then {
        $0.addSubview(mapView)
        let divider = $0.divider
        
        mapView.snp.makeConstraints { make in
            make.top.equalTo(divider.snp.bottom).offset(12)
            make.leading.equalToSuperview().offset(12)
            make.trailing.equalToSuperview().offset(-12)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
    
    let mapView = MKMapView()
    
    let detailWeatherCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let itemWidth = (OWConst.ScreenSize.width.value / 2) - 24
        layout.itemSize = .init(width: itemWidth, height: itemWidth)
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.scrollDirection = .vertical
        
        let cv = UICollectionView(frame: .zero,
                                  collectionViewLayout: layout)
        cv.register(DetailWeatherCell.self,
                    forCellWithReuseIdentifier: DetailWeatherCell.identifier)
        cv.backgroundColor = .clear
        return cv
    }()
    
    let listButton = UIButton().then {
        let image = UIImage(systemName: "list.bullet")
        $0.setImage(image, for: .normal)
        $0.tintColor = .white
        $0.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 25), forImageIn: .normal)
    }
    
    let mapButton = UIButton().then {
        let image = UIImage(systemName: "map")
        $0.setImage(image, for: .normal)
        $0.tintColor = .white
        $0.setPreferredSymbolConfiguration(UIImage.SymbolConfiguration(pointSize: 25), forImageIn: .normal)
    }
    
    lazy var bottomNavigationView = UIView().then {
        $0.addSubviews(mapButton, listButton)
        
        mapButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
        }
        
        listButton.snp.makeConstraints { make in
            make.size.equalTo(50)
            make.trailing.equalToSuperview().offset(-20)
            make.centerY.equalToSuperview()
        }
    }
    
    // MARK: - Helpers
    
    override func configureHierarchy() {
        addSubviews(backgroundView, scrollView, bottomNavigationView)
        contentView.addSubviews(cityLabel, tempLabel, weatherStateLabel, highTempLabel, lowTempLabel, divider, threeHourHeaderView, fiveDayHeaderView, locationHeaderView, detailWeatherCollectionView)
    }
    
    override func configureLayout() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.bottom.equalTo(bottomNavigationView.snp.top)
            make.horizontalEdges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        cityLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
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
        
        threeHourHeaderView.snp.makeConstraints { make in
            make.top.equalTo(highTempLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(160 + 57)
        }
        
        fiveDayHeaderView.snp.makeConstraints { make in
            make.top.equalTo(threeHourHeaderView.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(230 + 57)
        }
        
        locationHeaderView.snp.makeConstraints { make in
            make.top.equalTo(fiveDayHeaderView.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(230 + 57)
        }
        
        detailWeatherCollectionView.snp.makeConstraints { make in
            make.top.equalTo(locationHeaderView.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(OWConst.ScreenSize.width.value - 40)
            make.bottom.equalToSuperview()
        }
        
        bottomNavigationView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
            make.height.equalTo(80)
        }
    }
}
