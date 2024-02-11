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
//    static let defaultCity = City(id: 0, name: "", country: "", coord: CityCoord(lon: 0, lat: 0))
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.country = try container.decode(String.self, forKey: .country)
        self.coord = try container.decode(CityCoord.self, forKey: .coord)
    }
}

struct CityCoord: Codable {
    let lon: Double
    let lat: Double
}
