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
    
    lazy var detailWeather = setDetailWeather(self)
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

extension CurrentWeather {
    
    private func setDetailWeather(_ input: CurrentWeather) -> [DetailWeather] {
        var arr: [DetailWeather] = []
        let wind = DetailWeather(type: .wind, image: "wind", title: "바람 속도", value: String(input.wind?.speed ?? 0) + "m/s")
        arr.append(wind)
        let cloud = DetailWeather(type: .cloud, image: "cloud", title: "구름", value: String(input.clouds?.all ?? 0) + "%")
        arr.append(cloud)
        let pressure = DetailWeather(type: .pressure, image: "thermometer.medium", title: "기압", value: String(input.main?.pressure ?? 0) + "hpa")
        arr.append(pressure)
        let humidity = DetailWeather(type: .humidity, image: "humidity", title: "습도", value: String(input.main?.humidity ?? 0) + "%")
        arr.append(humidity)
        return arr
    }
}
