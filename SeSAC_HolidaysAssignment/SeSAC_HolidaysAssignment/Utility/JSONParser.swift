//
//  JSONDecoder.swift
//  SeSAC_HolidaysAssignment
//
//  Created by Deokhun KIM on 2/8/24.
//

import Foundation

final class JSONParser {
    
    func parseData<T: Decodable>(type: T.Type = T.self,
                                 data: Data,
                                 completion: (Result<T, WeatherError>) -> Void) {
        do {
            let result = try JSONDecoder().decode(type, from: data)
            completion(.success(result))
        } catch {
            completion(.failure(.parseError))
        }
    }
    
    func readJSON(name: String) -> Data? {
        guard let filePath = Bundle.main.path(forResource: name, ofType: "json") else { return nil }
        let fileUrl = URL(fileURLWithPath: filePath)
        let data = try? Data(contentsOf: fileUrl)
        return data
    }
}
