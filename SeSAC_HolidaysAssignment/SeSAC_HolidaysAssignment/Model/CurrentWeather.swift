//
//  OpenWeather.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/7/24.
//

import Foundation

// MARK: - CurrentWeather
struct CurrentWeather: Decodable {
    let coord: Coord? //위경도
    let weather: [Weather]?
    let main: Main?
    let visibility: Int?
    let wind: Wind?
    let clouds: Clouds?
    let dt: Int?
    let sys: Sys?  //해뜨고지는시간
    let id: Int?
    let name: String? //도시 이름
    
    static let defaultModel = CurrentWeather(coord: nil, weather: nil, main: nil, visibility: nil, wind: nil, clouds: nil, dt: nil, sys: nil, id: nil, name: nil)
}

// MARK: - Clouds
struct Clouds: Decodable {
    let all: Int //구름 퍼센트
}

// MARK: - Coord
struct Coord: Decodable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Decodable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

// MARK: - Sys
struct Sys: Decodable {
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Decodable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Wind
struct Wind: Decodable {
    let speed: Double
    let deg: Int
}
