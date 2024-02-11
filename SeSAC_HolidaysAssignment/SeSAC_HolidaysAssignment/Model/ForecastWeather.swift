//
//  ForecastWeather.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/7/24.
//

import Foundation

// MARK: - Forecast
struct Forecast: Decodable {
    let list: [List]?
    let city: ForecastCity?
    
//    static let defaultModel = Forecast(list: nil, city: nil)
    
    enum CodingKeys: CodingKey {
        case list
        case city
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.list = try container.decodeIfPresent([List].self, forKey: .list)
        self.city = try container.decodeIfPresent(ForecastCity.self, forKey: .city)
    }
}

// MARK: - City
struct ForecastCity: Decodable {
    let id: Int
    let name: String
    let coord: ForecastCoord
    let country: String
    let population, sunrise, sunset: Int
}

// MARK: - Coord
struct ForecastCoord: Decodable {
    let lat, lon: Double
}

// MARK: - List
struct List: Decodable {
    let dt: Int
    let main: MainClass
    let weather: [ForecastWeather]
    let wind: Wind
    let visibility: Int         //가시성
    let pop: Double           //강수확률
    let dtTxt: String         //시간
    let snow: Snow?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, wind, visibility, pop
        case dtTxt = "dt_txt"
        case snow
    }
}

// MARK: - MainClass
struct MainClass: Decodable {
    let temp, feelsLike, tempMin, tempMax: Double
    let pressure, humidity: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure
        case humidity
    }
}

// MARK: - Snow
struct Snow: Decodable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - Weather
struct ForecastWeather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String         //아이콘 이름
}

// MARK: - Wind
struct ForecastWind: Decodable {
    let speed: Double
    let deg: Int
    let gust: Double
}
