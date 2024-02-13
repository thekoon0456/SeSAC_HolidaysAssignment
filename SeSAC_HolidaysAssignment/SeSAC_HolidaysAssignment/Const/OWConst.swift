//
//  Const.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/7/24.
//

import UIKit

enum OWConst {
    
    enum BGImage {
        case sunny
        
        var image: UIImage? {
            switch self {
            case .sunny:
                UIImage(named: "sunny")
            }
        }
    }
    
    enum Icon {
        case list
        case map
        case mappin
        case calender
        case thermometer
        
        var image: UIImage? {
            switch self {
            case .list:
                UIImage(systemName: "list.bullet")
            case .map:
                UIImage(systemName: "map")
            case .mappin:
                UIImage(systemName: "mappin")
            case .calender:
                UIImage(systemName: "calendar")
            case .thermometer:
                UIImage(systemName: "thermometer.medium")
            }
        }
    }
    
    enum Title {
        case threeHourForecast
        case fiveDaysForecast
        case mapTitle
        case location
        case wind
        case cloud
        case pressure
        case humidity
        case city
        case currentLocation
        
        var text: String {
            switch self {
            case .threeHourForecast:
                "3시간 간격의 일기예보"
            case .fiveDaysForecast:
                "5일 간의 일기예보"
            case .mapTitle:
                "지도로 날씨 선택하기"
            case .location:
                "위치"
            case .wind:
                "바람 속도"
            case .cloud:
                "구름"
            case .pressure:
                "기압"
            case .humidity:
                "습도"
            case .city:
                "City"
            case .currentLocation:
                "현재 위치"
            }
        }
    }
    
    enum Ment {
        case setLocation
        case setting
        case placeHolder
        case retry
        case ok
        
        var text: String {
            switch self {
            case .setLocation:
                "해당 지역의 날씨를 설정하시겠습니까?"
            case .setting:
                "설정하기"
            case .placeHolder:
                "Search for a city"
            case .retry:
                "재시도하기"
            case .ok:
                "확인"
            }
        }
    }
    
    enum JSON {
        case cityList
        
        var fileName: String {
            switch self {
            case .cityList:
                "CityList"
            }
        }
    }
    
    enum Temp {
        case normal(temp: Double)
        case demical(temp: Double)
        case low
        case high
        
        var value: String {
            switch self {
            case .normal(let temp):
                String(format: "%.0f", temp - 273.15) + "°"
            case .demical(let temp):
                String(format: "%.1f", temp - 273.15) + "°"
            case .low:
                "최저 "
            case .high:
                "최고 "
            }
        }
    }
    
    enum Time {
        case twelve
        case today
        
        var value: String {
            switch self {
            case .twelve:
                "12시"
            case .today:
                "오늘"
            }
        }
    }
    
    enum ScreenSize {
        case width
        case height
        
        var value: CGFloat {
            switch self {
            case .width:
                UIScreen.main.bounds.width
            case .height:
                UIScreen.main.bounds.height
            }
        }
    }
    
    enum Map {
        case defaultMeter
        
        var value: Double {
            switch self {
            case .defaultMeter:
                return 100000
            }
        }
    }
    
}
