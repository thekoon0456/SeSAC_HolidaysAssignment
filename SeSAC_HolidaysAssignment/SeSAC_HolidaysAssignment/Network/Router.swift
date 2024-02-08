//
//  Router.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/8/24.
//

import Foundation

enum Router {
    case locationWeather(lat: Double, lon: Double) //37.654165, 127.049696
    case cityWeather(id: Int) //1846266
    case locationForecast(lat: Double, lon: Double)
    case cityForecast(id: Int)
    case icon(icon: String) //10d@2x.png
    
    var baseURL: String {
        switch self {
        case .locationWeather, .cityWeather,
             .locationForecast, .cityForecast, .icon:
        "https://api.openweathermap.org"
        }
    }
    
    var method: String {
        switch self {
        case .locationWeather, .cityWeather,
             .locationForecast, .cityForecast, .icon:
            "GET"
        }
    }
    
    var endPoint: String {
        switch self {
        case .locationWeather, .cityWeather:
            baseURL + "/data/2.5/weather"
        case .locationForecast, .cityForecast:
            baseURL + "/data/2.5/forecast"
        case .icon(let icon):
            baseURL + "/img/wn/\(icon) + @2x.png"
        }
    }
    
    var param: [String: String] {
        switch self {
        case .locationWeather(let lat, let lon),
             .locationForecast(let lat, let lon):
            ["lat": "\(lat)",
             "lon": "\(lon)",
             "appid": API_KEY.openWeather.key]
        case .cityWeather(let id),
             .cityForecast(let id):
            ["id": "\(id)",
             "appid": API_KEY.openWeather.key]
        case .icon:
            [:]
        }
    }
}
