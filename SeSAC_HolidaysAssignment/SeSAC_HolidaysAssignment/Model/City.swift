//
//  City.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/8/24.
//

import Foundation

// MARK: - CityJSON, UserDefaults 사용 위해 Codable 채택

struct City: Codable {
    let id: Int
    let name: String
    let country: String
    let coord: CityCoord
    
    static let key: String = "CityKEY"
    static let defaultCity = City(id: 0, name: "", country: "", coord: CityCoord(lon: 0, lat: 0))
    
}

struct CityCoord: Codable {
    let lon: Double
    let lat: Double
}
