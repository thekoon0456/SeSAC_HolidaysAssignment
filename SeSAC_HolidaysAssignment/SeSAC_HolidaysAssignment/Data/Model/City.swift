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
    static let defaultCity = City(id: 1846266, name: "Seoul", country: "KR", coord: CityCoord(lat: 37.654165,
                                                                                              lon: 127.049696))
}

struct CityCoord: Codable {
    let lat: Double
    let lon: Double
}
