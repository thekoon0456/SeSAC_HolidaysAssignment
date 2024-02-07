//
//  APIManager.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/7/24.
//

import Foundation

//icon 예시
//https://openweathermap.org/img/wn/10d@2x.png

//온도 -273.15°C

//최초 진입시 CityID (1835847) 날씨정보 보여줌
//가장 마지막에 검색한 CityID 기준 날씨정보 보여줌 (저장)

//3시간 간격 일기예보: 3시간 간격, 3일, 가로 스크롤

//5일 일기예보: 날씨 아이콘, 최고, 최저 온도

//바람속도, 구름, 기압, 습도

final class APIManager {
    
    static let shared = APIManager()
    
    private init() { }
    
    func requestAPI<T: Decodable>(api: T, type: T.Type = T.self, completion: @escaping (() -> Void)) {
        
//        URLSession.shared.dataTask(with: <#T##URLRequest#>) { data, response, error in
//            <#code#>
//        }
        
    }
    
}
