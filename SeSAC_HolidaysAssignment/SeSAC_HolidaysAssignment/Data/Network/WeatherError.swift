//
//  WeatherError.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/8/24.
//

import Foundation

enum WeatherError: Error {
    case wrongURL
    case responseError
    case parseError
    case dataError
    case unknownError
    
    var title: String {
        switch self {
        case .wrongURL:
            "URL에러"
        case .responseError:
            "응답 에러"
        case .parseError:
            "파싱 에러"
        case .dataError:
            "데이터 에러"
        case .unknownError:
            "알 수 없는 에러"
        }
    }
    
    var description: String {
        switch self {
        case .wrongURL:
            "올바른 URL을 입력해주세요"
        case .responseError:
            "서버 응답을 확인해주세요"
        case .parseError:
            "JSON 파싱 에러입니다."
        case .dataError:
            "서버의 데이터 에러입니다."
        case .unknownError:
            "알 수 없는 에러가 발생했습니다."
        }
    }
}
