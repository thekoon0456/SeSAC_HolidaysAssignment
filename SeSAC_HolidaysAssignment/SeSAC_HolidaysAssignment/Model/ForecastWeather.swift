//
//  ForecastWeather.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/7/24.
//

import Foundation

// MARK: - Forecast
struct Forecast: Codable {
    let list: [List]
    let city: ForecastCity
}

// MARK: - City
struct ForecastCity: Codable {
    let id: Int
    let name: String
    let coord: ForecastCoord
    let country: String
    let population, sunrise, sunset: Int
}

// MARK: - Coord
struct ForecastCoord: Codable {
    let lat, lon: Double
}

// MARK: - List
struct List: Codable {
    let dt: Int
    let main: MainClass
    let weather: [Weather]
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
struct MainClass: Codable {
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
struct Snow: Codable {
    let the3H: Double

    enum CodingKeys: String, CodingKey {
        case the3H = "3h"
    }
}

// MARK: - Weather
struct ForecastWeather: Codable {
    let id: Int
    let main: String
    let description: String
    let icon: String         //아이콘 이름
}

// MARK: - Wind
struct ForecastWind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}
