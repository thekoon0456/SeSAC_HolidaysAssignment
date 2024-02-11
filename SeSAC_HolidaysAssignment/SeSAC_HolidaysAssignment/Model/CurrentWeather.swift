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
    
//    static let defaultModel = CurrentWeather()
    
    enum CodingKeys: CodingKey {
        case coord
        case weather
        case main
        case visibility
        case wind
        case clouds
        case dt
        case sys
        case id
        case name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.coord = try container.decodeIfPresent(Coord.self, forKey: .coord)
        self.weather = try container.decodeIfPresent([Weather].self, forKey: .weather)
        self.main = try container.decodeIfPresent(Main.self, forKey: .main)
        self.visibility = try container.decodeIfPresent(Int.self, forKey: .visibility)
        self.wind = try container.decodeIfPresent(Wind.self, forKey: .wind)
        self.clouds = try container.decodeIfPresent(Clouds.self, forKey: .clouds)
        self.dt = try container.decodeIfPresent(Int.self, forKey: .dt)
        self.sys = try container.decodeIfPresent(Sys.self, forKey: .sys)
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
    }
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
