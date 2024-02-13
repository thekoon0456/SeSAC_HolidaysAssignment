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
        case cloudy
        case rainy
        case snowing
        
        var image: UIImage? {
            switch self {
            case .sunny:
                UIImage(named: "sunny")
            case .cloudy:
                UIImage(named: "cloudy")
            case .rainy:
                UIImage(named: "rainy")
            case .snowing:
                UIImage(named: "snowing")
            }
        }
    }
    
    enum Title {
        case collectionViewTitle(count: String)
        case location
        case wind
        case cloud
        case pressure
        case humidity
        case city
        
        var text: String {
            switch self {
            case .collectionViewTitle(let count):
                "\(count) 일기예보"
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
        case meter
        case zoom
        
        var value: Double {
            switch self {
            case .meter:
                return 10000
            case .zoom:
                return 1000
            }
        }
    }
}
