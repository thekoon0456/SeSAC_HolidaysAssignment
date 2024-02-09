//
//  DetailWeather.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/9/24.
//

import Foundation

struct DetailWeather {
    let type: DetailWeatherType
    let image: String
    let title: String
    let value: String
    
    static let defaultModel = DetailWeather(type: .cloud, image: "", title: "", value: "")
}

enum DetailWeatherType: CaseIterable {
    case wind
    case cloud
    case pressure
    case humidity
}
