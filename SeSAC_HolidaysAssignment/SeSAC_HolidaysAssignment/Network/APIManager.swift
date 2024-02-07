//
//  APIManager.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/7/24.
//

import Foundation

final class APIManager {
    
    static let shared = APIManager()
    
    private init() { }
    
    func requestAPI<T: Decodable>(api: T, type: T.Type = T.self, completion: @escaping (() -> Void)) {
        
//        URLSession.shared.dataTask(with: <#T##URLRequest#>) { data, response, error in
//            <#code#>
//        }
        
    }
    
}
