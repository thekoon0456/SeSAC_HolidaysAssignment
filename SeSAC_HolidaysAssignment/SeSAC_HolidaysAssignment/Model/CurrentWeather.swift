//
//  OpenWeather.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/7/24.
//

import Foundation

// MARK: - CurrentWeather
struct CurrentWeather: Codable {
    let coord: Coord //위경도
    let weather: [Weather]
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys  //해뜨고지는시간
    let id: Int
    let name: String //도시 이름
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int //구름 퍼센트
}

// MARK: - Coord
struct Coord: Codable {
    let lon, lat: Double
}

// MARK: - Main
struct Main: Codable {
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
struct Sys: Codable {
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, description, icon: String
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
}
