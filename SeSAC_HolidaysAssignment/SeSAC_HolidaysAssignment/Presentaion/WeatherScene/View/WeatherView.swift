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
    
    private let mapView = MKMapView().then {
        let locationManager = LocationManager.shared
        let coordinate = CLLocationCoordinate2D(latitude: locationManager.lat,
                                                longitude: locationManager.lon)
        let region = MKCoordinateRegion(center: coordinate,
                                       latitudinalMeters: 10000,
                                       longitudinalMeters: 10000)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        $0.setRegion(region, animated: true)
        $0.addAnnotation(annotation)
    }
    
    let detailWeatherCollectionView = {
        let layout = UICollectionViewFlowLayout()
        let itemWidth = (Const.ScreenSize.width.value / 2) - 24
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
    
    // MARK: - Helpers
    
    override func configureHierarchy() {
        addSubviews(backgroundView, scrollView)
        contentView.addSubviews(cityLabel, tempLabel, weatherStateLabel, highTempLabel, lowTempLabel, divider, threeHourHeaderView, fiveDayHeaderView, locationHeaderView, detailWeatherCollectionView)
    }
    
    override func configureLayout() {
        backgroundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        scrollView.snp.makeConstraints { make in
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
            make.height.equalTo(Const.ScreenSize.width.value - 40)
            make.bottom.equalToSuperview()
        }
    }
}
