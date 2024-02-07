//
//  ForecastWeather.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/7/24.
//

import Foundation

//OpenWeatherForecastCurrent
//http://api.openweathermap.org/data/2.5/forecast?lat=37.654165&lon=127.049696&appid=cb205049b39ddde939861858d5531470

//OpenWeatherForecastCityID
//https://api.openweathermap.org/data/2.5/forecast?id=1846266&appid=cb205049b39ddde939861858d5531470


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
    let population, timezone, sunrise, sunset: Int
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
    let clouds: Int
    let wind: Wind
    let visibility: Int         //가시성
    let pop: Double           //강수확률
    let dtTxt: String         //시간
    let snow: Snow?

    enum CodingKeys: String, CodingKey {
        case dt, main, weather, clouds, wind, visibility, pop
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
    let icon: String         //////아이콘!!!
}

// MARK: - Wind
struct ForecastWind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}

/*
 {
     "cod": "200",
     "message": 0,
     "cnt": 40,
     "list": [
         {
             "dt": 1707318000,
             "main": {
                 "temp": 272.55,
                 "feels_like": 272.55,
                 "temp_min": 272.55,
                 "temp_max": 273.7,
                 "pressure": 1023,
                 "sea_level": 1023,
                 "grnd_level": 1019,
                 "humidity": 65,
                 "temp_kf": -1.15
             },
             "weather": [
                 {
                     "id": 803,
                     "main": "Clouds",
                     "description": "broken clouds",
                     "icon": "04n"
                 }
             ],
             "clouds": {
                 "all": 53
             },
             "wind": {
                 "speed": 0.95,
                 "deg": 280,
                 "gust": 1.52
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "n"
             },
             "dt_txt": "2024-02-07 15:00:00"
         },
         {
             "dt": 1707328800,
             "main": {
                 "temp": 272.78,
                 "feels_like": 272.78,
                 "temp_min": 272.78,
                 "temp_max": 273.18,
                 "pressure": 1022,
                 "sea_level": 1022,
                 "grnd_level": 1019,
                 "humidity": 69,
                 "temp_kf": -0.4
             },
             "weather": [
                 {
                     "id": 802,
                     "main": "Clouds",
                     "description": "scattered clouds",
                     "icon": "03n"
                 }
             ],
             "clouds": {
                 "all": 30
             },
             "wind": {
                 "speed": 0.63,
                 "deg": 260,
                 "gust": 0.82
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "n"
             },
             "dt_txt": "2024-02-07 18:00:00"
         },
         {
             "dt": 1707339600,
             "main": {
                 "temp": 272.96,
                 "feels_like": 272.96,
                 "temp_min": 272.96,
                 "temp_max": 272.96,
                 "pressure": 1022,
                 "sea_level": 1022,
                 "grnd_level": 1018,
                 "humidity": 74,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 800,
                     "main": "Clear",
                     "description": "clear sky",
                     "icon": "01n"
                 }
             ],
             "clouds": {
                 "all": 7
             },
             "wind": {
                 "speed": 0.56,
                 "deg": 215,
                 "gust": 0.74
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "n"
             },
             "dt_txt": "2024-02-07 21:00:00"
         },
         {
             "dt": 1707350400,
             "main": {
                 "temp": 273.74,
                 "feels_like": 273.74,
                 "temp_min": 273.74,
                 "temp_max": 273.74,
                 "pressure": 1023,
                 "sea_level": 1023,
                 "grnd_level": 1019,
                 "humidity": 71,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 800,
                     "main": "Clear",
                     "description": "clear sky",
                     "icon": "01d"
                 }
             ],
             "clouds": {
                 "all": 7
             },
             "wind": {
                 "speed": 1.05,
                 "deg": 227,
                 "gust": 2.01
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "d"
             },
             "dt_txt": "2024-02-08 00:00:00"
         },
         {
             "dt": 1707361200,
             "main": {
                 "temp": 276.14,
                 "feels_like": 274.48,
                 "temp_min": 276.14,
                 "temp_max": 276.14,
                 "pressure": 1023,
                 "sea_level": 1023,
                 "grnd_level": 1019,
                 "humidity": 56,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 802,
                     "main": "Clouds",
                     "description": "scattered clouds",
                     "icon": "03d"
                 }
             ],
             "clouds": {
                 "all": 47
             },
             "wind": {
                 "speed": 1.74,
                 "deg": 252,
                 "gust": 2.14
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "d"
             },
             "dt_txt": "2024-02-08 03:00:00"
         },
         {
             "dt": 1707372000,
             "main": {
                 "temp": 277.88,
                 "feels_like": 276.28,
                 "temp_min": 277.88,
                 "temp_max": 277.88,
                 "pressure": 1021,
                 "sea_level": 1021,
                 "grnd_level": 1017,
                 "humidity": 39,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 802,
                     "main": "Clouds",
                     "description": "scattered clouds",
                     "icon": "03d"
                 }
             ],
             "clouds": {
                 "all": 30
             },
             "wind": {
                 "speed": 1.93,
                 "deg": 293,
                 "gust": 2.44
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "d"
             },
             "dt_txt": "2024-02-08 06:00:00"
         },
         {
             "dt": 1707382800,
             "main": {
                 "temp": 276.84,
                 "feels_like": 275.16,
                 "temp_min": 276.84,
                 "temp_max": 276.84,
                 "pressure": 1021,
                 "sea_level": 1021,
                 "grnd_level": 1017,
                 "humidity": 37,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 803,
                     "main": "Clouds",
                     "description": "broken clouds",
                     "icon": "04d"
                 }
             ],
             "clouds": {
                 "all": 69
             },
             "wind": {
                 "speed": 1.85,
                 "deg": 269,
                 "gust": 1.95
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "d"
             },
             "dt_txt": "2024-02-08 09:00:00"
         },
         {
             "dt": 1707393600,
             "main": {
                 "temp": 274.97,
                 "feels_like": 273.67,
                 "temp_min": 274.97,
                 "temp_max": 274.97,
                 "pressure": 1022,
                 "sea_level": 1022,
                 "grnd_level": 1019,
                 "humidity": 46,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 803,
                     "main": "Clouds",
                     "description": "broken clouds",
                     "icon": "04n"
                 }
             ],
             "clouds": {
                 "all": 56
             },
             "wind": {
                 "speed": 1.37,
                 "deg": 241,
                 "gust": 2.2
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "n"
             },
             "dt_txt": "2024-02-08 12:00:00"
         },
         {
             "dt": 1707404400,
             "main": {
                 "temp": 274.14,
                 "feels_like": 274.14,
                 "temp_min": 274.14,
                 "temp_max": 274.14,
                 "pressure": 1023,
                 "sea_level": 1023,
                 "grnd_level": 1019,
                 "humidity": 51,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 803,
                     "main": "Clouds",
                     "description": "broken clouds",
                     "icon": "04n"
                 }
             ],
             "clouds": {
                 "all": 74
             },
             "wind": {
                 "speed": 0.77,
                 "deg": 195,
                 "gust": 1.08
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "n"
             },
             "dt_txt": "2024-02-08 15:00:00"
         },
         {
             "dt": 1707415200,
             "main": {
                 "temp": 273.59,
                 "feels_like": 273.59,
                 "temp_min": 273.59,
                 "temp_max": 273.59,
                 "pressure": 1023,
                 "sea_level": 1023,
                 "grnd_level": 1019,
                 "humidity": 56,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 803,
                     "main": "Clouds",
                     "description": "broken clouds",
                     "icon": "04n"
                 }
             ],
             "clouds": {
                 "all": 83
             },
             "wind": {
                 "speed": 0.89,
                 "deg": 182,
                 "gust": 1.01
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "n"
             },
             "dt_txt": "2024-02-08 18:00:00"
         },
         {
             "dt": 1707426000,
             "main": {
                 "temp": 273.23,
                 "feels_like": 273.23,
                 "temp_min": 273.23,
                 "temp_max": 273.23,
                 "pressure": 1022,
                 "sea_level": 1022,
                 "grnd_level": 1019,
                 "humidity": 63,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 804,
                     "main": "Clouds",
                     "description": "overcast clouds",
                     "icon": "04n"
                 }
             ],
             "clouds": {
                 "all": 99
             },
             "wind": {
                 "speed": 0.99,
                 "deg": 188,
                 "gust": 1.75
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "n"
             },
             "dt_txt": "2024-02-08 21:00:00"
         },
         {
             "dt": 1707436800,
             "main": {
                 "temp": 273.83,
                 "feels_like": 273.83,
                 "temp_min": 273.83,
                 "temp_max": 273.83,
                 "pressure": 1024,
                 "sea_level": 1024,
                 "grnd_level": 1020,
                 "humidity": 60,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 803,
                     "main": "Clouds",
                     "description": "broken clouds",
                     "icon": "04d"
                 }
             ],
             "clouds": {
                 "all": 53
             },
             "wind": {
                 "speed": 1.2,
                 "deg": 219,
                 "gust": 1.89
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "d"
             },
             "dt_txt": "2024-02-09 00:00:00"
         },
         {
             "dt": 1707447600,
             "main": {
                 "temp": 276.42,
                 "feels_like": 274.04,
                 "temp_min": 276.42,
                 "temp_max": 276.42,
                 "pressure": 1024,
                 "sea_level": 1024,
                 "grnd_level": 1020,
                 "humidity": 36,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 800,
                     "main": "Clear",
                     "description": "clear sky",
                     "icon": "01d"
                 }
             ],
             "clouds": {
                 "all": 5
             },
             "wind": {
                 "speed": 2.46,
                 "deg": 253,
                 "gust": 3.66
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "d"
             },
             "dt_txt": "2024-02-09 03:00:00"
         },
         {
             "dt": 1707458400,
             "main": {
                 "temp": 277.64,
                 "feels_like": 274.15,
                 "temp_min": 277.64,
                 "temp_max": 277.64,
                 "pressure": 1022,
                 "sea_level": 1022,
                 "grnd_level": 1019,
                 "humidity": 36,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 800,
                     "main": "Clear",
                     "description": "clear sky",
                     "icon": "01d"
                 }
             ],
             "clouds": {
                 "all": 3
             },
             "wind": {
                 "speed": 4.41,
                 "deg": 270,
                 "gust": 5.65
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "d"
             },
             "dt_txt": "2024-02-09 06:00:00"
         },
         {
             "dt": 1707469200,
             "main": {
                 "temp": 276.01,
                 "feels_like": 272.75,
                 "temp_min": 276.01,
                 "temp_max": 276.01,
                 "pressure": 1023,
                 "sea_level": 1023,
                 "grnd_level": 1019,
                 "humidity": 50,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 800,
                     "main": "Clear",
                     "description": "clear sky",
                     "icon": "01d"
                 }
             ],
             "clouds": {
                 "all": 6
             },
             "wind": {
                 "speed": 3.45,
                 "deg": 264,
                 "gust": 5.01
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "d"
             },
             "dt_txt": "2024-02-09 09:00:00"
         },
         {
             "dt": 1707480000,
             "main": {
                 "temp": 274.95,
                 "feels_like": 272.85,
                 "temp_min": 274.95,
                 "temp_max": 274.95,
                 "pressure": 1024,
                 "sea_level": 1024,
                 "grnd_level": 1020,
                 "humidity": 58,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 800,
                     "main": "Clear",
                     "description": "clear sky",
                     "icon": "01n"
                 }
             ],
             "clouds": {
                 "all": 7
             },
             "wind": {
                 "speed": 1.95,
                 "deg": 244,
                 "gust": 4.52
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "n"
             },
             "dt_txt": "2024-02-09 12:00:00"
         },
         {
             "dt": 1707490800,
             "main": {
                 "temp": 273.96,
                 "feels_like": 272.56,
                 "temp_min": 273.96,
                 "temp_max": 273.96,
                 "pressure": 1024,
                 "sea_level": 1024,
                 "grnd_level": 1020,
                 "humidity": 60,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 800,
                     "main": "Clear",
                     "description": "clear sky",
                     "icon": "01n"
                 }
             ],
             "clouds": {
                 "all": 5
             },
             "wind": {
                 "speed": 1.35,
                 "deg": 264,
                 "gust": 3.01
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "n"
             },
             "dt_txt": "2024-02-09 15:00:00"
         },
         {
             "dt": 1707501600,
             "main": {
                 "temp": 273.31,
                 "feels_like": 273.31,
                 "temp_min": 273.31,
                 "temp_max": 273.31,
                 "pressure": 1024,
                 "sea_level": 1024,
                 "grnd_level": 1020,
                 "humidity": 61,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 800,
                     "main": "Clear",
                     "description": "clear sky",
                     "icon": "01n"
                 }
             ],
             "clouds": {
                 "all": 2
             },
             "wind": {
                 "speed": 0.83,
                 "deg": 254,
                 "gust": 1.02
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "n"
             },
             "dt_txt": "2024-02-09 18:00:00"
         },
         {
             "dt": 1707512400,
             "main": {
                 "temp": 273.19,
                 "feels_like": 273.19,
                 "temp_min": 273.19,
                 "temp_max": 273.19,
                 "pressure": 1024,
                 "sea_level": 1024,
                 "grnd_level": 1020,
                 "humidity": 62,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 802,
                     "main": "Clouds",
                     "description": "scattered clouds",
                     "icon": "03n"
                 }
             ],
             "clouds": {
                 "all": 30
             },
             "wind": {
                 "speed": 0.66,
                 "deg": 222,
                 "gust": 0.83
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "n"
             },
             "dt_txt": "2024-02-09 21:00:00"
         },
         {
             "dt": 1707523200,
             "main": {
                 "temp": 273.88,
                 "feels_like": 273.88,
                 "temp_min": 273.88,
                 "temp_max": 273.88,
                 "pressure": 1025,
                 "sea_level": 1025,
                 "grnd_level": 1022,
                 "humidity": 71,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 803,
                     "main": "Clouds",
                     "description": "broken clouds",
                     "icon": "04d"
                 }
             ],
             "clouds": {
                 "all": 65
             },
             "wind": {
                 "speed": 0.88,
                 "deg": 172,
                 "gust": 1.22
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "d"
             },
             "dt_txt": "2024-02-10 00:00:00"
         },
         {
             "dt": 1707534000,
             "main": {
                 "temp": 276.59,
                 "feels_like": 275.22,
                 "temp_min": 276.59,
                 "temp_max": 276.59,
                 "pressure": 1025,
                 "sea_level": 1025,
                 "grnd_level": 1022,
                 "humidity": 67,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 804,
                     "main": "Clouds",
                     "description": "overcast clouds",
                     "icon": "04d"
                 }
             ],
             "clouds": {
                 "all": 92
             },
             "wind": {
                 "speed": 1.57,
                 "deg": 221,
                 "gust": 2.84
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "d"
             },
             "dt_txt": "2024-02-10 03:00:00"
         },
         {
             "dt": 1707544800,
             "main": {
                 "temp": 277.78,
                 "feels_like": 275.25,
                 "temp_min": 277.78,
                 "temp_max": 277.78,
                 "pressure": 1024,
                 "sea_level": 1024,
                 "grnd_level": 1020,
                 "humidity": 61,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 600,
                     "main": "Snow",
                     "description": "light snow",
                     "icon": "13d"
                 }
             ],
             "clouds": {
                 "all": 89
             },
             "wind": {
                 "speed": 2.95,
                 "deg": 262,
                 "gust": 4.54
             },
             "visibility": 10000,
             "pop": 0.2,
             "snow": {
                 "3h": 0.12
             },
             "sys": {
                 "pod": "d"
             },
             "dt_txt": "2024-02-10 06:00:00"
         },
         {
             "dt": 1707555600,
             "main": {
                 "temp": 277.07,
                 "feels_like": 275.19,
                 "temp_min": 277.07,
                 "temp_max": 277.07,
                 "pressure": 1024,
                 "sea_level": 1024,
                 "grnd_level": 1020,
                 "humidity": 60,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 803,
                     "main": "Clouds",
                     "description": "broken clouds",
                     "icon": "04d"
                 }
             ],
             "clouds": {
                 "all": 60
             },
             "wind": {
                 "speed": 2.07,
                 "deg": 276,
                 "gust": 3.06
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "d"
             },
             "dt_txt": "2024-02-10 09:00:00"
         },
         {
             "dt": 1707566400,
             "main": {
                 "temp": 275.54,
                 "feels_like": 275.54,
                 "temp_min": 275.54,
                 "temp_max": 275.54,
                 "pressure": 1025,
                 "sea_level": 1025,
                 "grnd_level": 1021,
                 "humidity": 73,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 802,
                     "main": "Clouds",
                     "description": "scattered clouds",
                     "icon": "03n"
                 }
             ],
             "clouds": {
                 "all": 36
             },
             "wind": {
                 "speed": 1.08,
                 "deg": 245,
                 "gust": 1.32
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "n"
             },
             "dt_txt": "2024-02-10 12:00:00"
         },
         {
             "dt": 1707577200,
             "main": {
                 "temp": 274.72,
                 "feels_like": 274.72,
                 "temp_min": 274.72,
                 "temp_max": 274.72,
                 "pressure": 1025,
                 "sea_level": 1025,
                 "grnd_level": 1021,
                 "humidity": 80,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 803,
                     "main": "Clouds",
                     "description": "broken clouds",
                     "icon": "04n"
                 }
             ],
             "clouds": {
                 "all": 72
             },
             "wind": {
                 "speed": 0.58,
                 "deg": 178,
                 "gust": 0.62
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "n"
             },
             "dt_txt": "2024-02-10 15:00:00"
         },
         {
             "dt": 1707588000,
             "main": {
                 "temp": 274.24,
                 "feels_like": 274.24,
                 "temp_min": 274.24,
                 "temp_max": 274.24,
                 "pressure": 1025,
                 "sea_level": 1025,
                 "grnd_level": 1022,
                 "humidity": 82,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 804,
                     "main": "Clouds",
                     "description": "overcast clouds",
                     "icon": "04n"
                 }
             ],
             "clouds": {
                 "all": 86
             },
             "wind": {
                 "speed": 0.82,
                 "deg": 221,
                 "gust": 0.96
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "n"
             },
             "dt_txt": "2024-02-10 18:00:00"
         },
         {
             "dt": 1707598800,
             "main": {
                 "temp": 273.46,
                 "feels_like": 273.46,
                 "temp_min": 273.46,
                 "temp_max": 273.46,
                 "pressure": 1025,
                 "sea_level": 1025,
                 "grnd_level": 1022,
                 "humidity": 84,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 803,
                     "main": "Clouds",
                     "description": "broken clouds",
                     "icon": "04n"
                 }
             ],
             "clouds": {
                 "all": 53
             },
             "wind": {
                 "speed": 0.68,
                 "deg": 276,
                 "gust": 0.73
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "n"
             },
             "dt_txt": "2024-02-10 21:00:00"
         },
         {
             "dt": 1707609600,
             "main": {
                 "temp": 274.19,
                 "feels_like": 274.19,
                 "temp_min": 274.19,
                 "temp_max": 274.19,
                 "pressure": 1027,
                 "sea_level": 1027,
                 "grnd_level": 1023,
                 "humidity": 68,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 802,
                     "main": "Clouds",
                     "description": "scattered clouds",
                     "icon": "03d"
                 }
             ],
             "clouds": {
                 "all": 29
             },
             "wind": {
                 "speed": 0.99,
                 "deg": 274,
                 "gust": 1.5
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "d"
             },
             "dt_txt": "2024-02-11 00:00:00"
         },
         {
             "dt": 1707620400,
             "main": {
                 "temp": 276.83,
                 "feels_like": 274.38,
                 "temp_min": 276.83,
                 "temp_max": 276.83,
                 "pressure": 1027,
                 "sea_level": 1027,
                 "grnd_level": 1023,
                 "humidity": 32,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 800,
                     "main": "Clear",
                     "description": "clear sky",
                     "icon": "01d"
                 }
             ],
             "clouds": {
                 "all": 2
             },
             "wind": {
                 "speed": 2.62,
                 "deg": 278,
                 "gust": 3.79
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "d"
             },
             "dt_txt": "2024-02-11 03:00:00"
         },
         {
             "dt": 1707631200,
             "main": {
                 "temp": 278.36,
                 "feels_like": 275.14,
                 "temp_min": 278.36,
                 "temp_max": 278.36,
                 "pressure": 1026,
                 "sea_level": 1026,
                 "grnd_level": 1022,
                 "humidity": 28,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 800,
                     "main": "Clear",
                     "description": "clear sky",
                     "icon": "01d"
                 }
             ],
             "clouds": {
                 "all": 1
             },
             "wind": {
                 "speed": 4.23,
                 "deg": 275,
                 "gust": 5.62
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "d"
             },
             "dt_txt": "2024-02-11 06:00:00"
         },
         {
             "dt": 1707642000,
             "main": {
                 "temp": 276.7,
                 "feels_like": 273.16,
                 "temp_min": 276.7,
                 "temp_max": 276.7,
                 "pressure": 1027,
                 "sea_level": 1027,
                 "grnd_level": 1023,
                 "humidity": 50,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 800,
                     "main": "Clear",
                     "description": "clear sky",
                     "icon": "01d"
                 }
             ],
             "clouds": {
                 "all": 1
             },
             "wind": {
                 "speed": 4.12,
                 "deg": 258,
                 "gust": 6.49
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "d"
             },
             "dt_txt": "2024-02-11 09:00:00"
         },
         {
             "dt": 1707652800,
             "main": {
                 "temp": 275.34,
                 "feels_like": 272.31,
                 "temp_min": 275.34,
                 "temp_max": 275.34,
                 "pressure": 1029,
                 "sea_level": 1029,
                 "grnd_level": 1025,
                 "humidity": 59,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 800,
                     "main": "Clear",
                     "description": "clear sky",
                     "icon": "01n"
                 }
             ],
             "clouds": {
                 "all": 1
             },
             "wind": {
                 "speed": 2.96,
                 "deg": 266,
                 "gust": 6.88
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "n"
             },
             "dt_txt": "2024-02-11 12:00:00"
         },
         {
             "dt": 1707663600,
             "main": {
                 "temp": 274.49,
                 "feels_like": 274.49,
                 "temp_min": 274.49,
                 "temp_max": 274.49,
                 "pressure": 1030,
                 "sea_level": 1030,
                 "grnd_level": 1026,
                 "humidity": 69,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 800,
                     "main": "Clear",
                     "description": "clear sky",
                     "icon": "01n"
                 }
             ],
             "clouds": {
                 "all": 2
             },
             "wind": {
                 "speed": 1.22,
                 "deg": 241,
                 "gust": 2.38
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "n"
             },
             "dt_txt": "2024-02-11 15:00:00"
         },
         {
             "dt": 1707674400,
             "main": {
                 "temp": 274,
                 "feels_like": 274,
                 "temp_min": 274,
                 "temp_max": 274,
                 "pressure": 1030,
                 "sea_level": 1030,
                 "grnd_level": 1027,
                 "humidity": 76,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 800,
                     "main": "Clear",
                     "description": "clear sky",
                     "icon": "01n"
                 }
             ],
             "clouds": {
                 "all": 3
             },
             "wind": {
                 "speed": 1.09,
                 "deg": 190,
                 "gust": 1.1
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "n"
             },
             "dt_txt": "2024-02-11 18:00:00"
         },
         {
             "dt": 1707685200,
             "main": {
                 "temp": 273.76,
                 "feels_like": 273.76,
                 "temp_min": 273.76,
                 "temp_max": 273.76,
                 "pressure": 1030,
                 "sea_level": 1030,
                 "grnd_level": 1027,
                 "humidity": 82,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 800,
                     "main": "Clear",
                     "description": "clear sky",
                     "icon": "01n"
                 }
             ],
             "clouds": {
                 "all": 7
             },
             "wind": {
                 "speed": 1.31,
                 "deg": 159,
                 "gust": 1.33
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "n"
             },
             "dt_txt": "2024-02-11 21:00:00"
         },
         {
             "dt": 1707696000,
             "main": {
                 "temp": 274.85,
                 "feels_like": 273.44,
                 "temp_min": 274.85,
                 "temp_max": 274.85,
                 "pressure": 1032,
                 "sea_level": 1032,
                 "grnd_level": 1028,
                 "humidity": 76,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 800,
                     "main": "Clear",
                     "description": "clear sky",
                     "icon": "01d"
                 }
             ],
             "clouds": {
                 "all": 7
             },
             "wind": {
                 "speed": 1.43,
                 "deg": 149,
                 "gust": 2.45
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "d"
             },
             "dt_txt": "2024-02-12 00:00:00"
         },
         {
             "dt": 1707706800,
             "main": {
                 "temp": 278.69,
                 "feels_like": 277.02,
                 "temp_min": 278.69,
                 "temp_max": 278.69,
                 "pressure": 1031,
                 "sea_level": 1031,
                 "grnd_level": 1027,
                 "humidity": 53,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 800,
                     "main": "Clear",
                     "description": "clear sky",
                     "icon": "01d"
                 }
             ],
             "clouds": {
                 "all": 7
             },
             "wind": {
                 "speed": 2.13,
                 "deg": 193,
                 "gust": 3.23
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "d"
             },
             "dt_txt": "2024-02-12 03:00:00"
         },
         {
             "dt": 1707717600,
             "main": {
                 "temp": 281.21,
                 "feels_like": 279.29,
                 "temp_min": 281.21,
                 "temp_max": 281.21,
                 "pressure": 1029,
                 "sea_level": 1029,
                 "grnd_level": 1026,
                 "humidity": 39,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 800,
                     "main": "Clear",
                     "description": "clear sky",
                     "icon": "01d"
                 }
             ],
             "clouds": {
                 "all": 7
             },
             "wind": {
                 "speed": 3.07,
                 "deg": 226,
                 "gust": 4.58
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "d"
             },
             "dt_txt": "2024-02-12 06:00:00"
         },
         {
             "dt": 1707728400,
             "main": {
                 "temp": 279.5,
                 "feels_like": 277.78,
                 "temp_min": 279.5,
                 "temp_max": 279.5,
                 "pressure": 1029,
                 "sea_level": 1029,
                 "grnd_level": 1026,
                 "humidity": 48,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 803,
                     "main": "Clouds",
                     "description": "broken clouds",
                     "icon": "04d"
                 }
             ],
             "clouds": {
                 "all": 74
             },
             "wind": {
                 "speed": 2.34,
                 "deg": 229,
                 "gust": 5.11
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "d"
             },
             "dt_txt": "2024-02-12 09:00:00"
         },
         {
             "dt": 1707739200,
             "main": {
                 "temp": 277.61,
                 "feels_like": 276.4,
                 "temp_min": 277.61,
                 "temp_max": 277.61,
                 "pressure": 1030,
                 "sea_level": 1030,
                 "grnd_level": 1026,
                 "humidity": 61,
                 "temp_kf": 0
             },
             "weather": [
                 {
                     "id": 802,
                     "main": "Clouds",
                     "description": "scattered clouds",
                     "icon": "03n"
                 }
             ],
             "clouds": {
                 "all": 40
             },
             "wind": {
                 "speed": 1.56,
                 "deg": 188,
                 "gust": 2.61
             },
             "visibility": 10000,
             "pop": 0,
             "sys": {
                 "pod": "n"
             },
             "dt_txt": "2024-02-12 12:00:00"
         }
     ],
     "city": {
         "id": 1835847,
         "name": "Seoul",
         "coord": {
             "lat": 37.6542,
             "lon": 127.0497
         },
         "country": "KR",
         "population": 0,
         "timezone": 32400,
         "sunrise": 1707258670,
         "sunset": 1707296437
     }
 }
 */
