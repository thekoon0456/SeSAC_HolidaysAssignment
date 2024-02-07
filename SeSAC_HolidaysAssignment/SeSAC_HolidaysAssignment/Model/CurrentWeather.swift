//
//  OpenWeather.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/7/24.
//

import Foundation

/*
 {
     "coord": {
         "lon": 127.046,
         "lat": 37.6456
     },
     "weather": [
         {
             "id": 803,
             "main": "Clouds",
             "description": "broken clouds",
             "icon": "04n"
         }
     ],
     "main": {
         "temp": 271.91,
         "feels_like": 271.91, //체감온도
         "temp_min": 271.91,
         "temp_max": 272.48,
         "pressure": 1023,
         "humidity": 62, //습도
     },
     "visibility": 10000, //가시성
     "wind": {
         "speed": 1.2, //바람 스피드
         "deg": 294, //바람 방향
     },
     "clouds": {
         "all": 76 //구름 퍼센트
     },
     "dt": 1707307294, //데이터 갱신 시간 timestamp 1970
     "sys": {
         "type": 1,
         "id": 5509,
         "country": "KR",
         "sunrise": 1707258670,
         "sunset": 1707296439
     },
     "id": 1835847,
     "name": "Seoul",
 }
 */

//currentAPI
//https://api.openweathermap.org/data/2.5/weather?lat=37.654165&lon=127.049696&appid=cb205049b39ddde939861858d5531470

//CityID
//https://api.openweathermap.org/data/2.5/weather?id=1846266&appid=cb205049b39ddde939861858d5531470

// MARK: - CurrentWeather
struct CurrentWeather: Codable {
    let coord: Coord
    let weather: [Weather]
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys  //해뜨고지는시간
    let timezone, id: Int
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
    let pressure, humidity, seaLevel, grndLevel: Int

    enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
        case seaLevel = "sea_level"
        case grndLevel = "grnd_level"
    }
}

// MARK: - Sys
struct Sys: Codable {
    let type, id: Int
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
    let gust: Double
}
