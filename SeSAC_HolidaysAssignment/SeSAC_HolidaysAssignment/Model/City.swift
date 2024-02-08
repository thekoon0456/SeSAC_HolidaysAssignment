//
//  City.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/8/24.
//

import Foundation

struct City {
    let id: Int
    let name: String
    let country: String
    let coord: CityCoord
}

struct CityCoord {
    let lon: Double
    let lat: Double
}
