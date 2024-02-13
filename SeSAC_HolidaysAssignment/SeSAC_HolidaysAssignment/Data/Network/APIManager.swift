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
    
    func requestAPI<T: Decodable>(api: Router,
                                  type: T.Type = T.self,
                                  completion: @escaping ((Result<T,WeatherError>) -> Void)) {
        
        guard let request = try? getRequest(api: api) else {
            completion(.failure(.wrongURL))
            return
        }
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let error {
                print(error.localizedDescription)
                completion(.failure(.unknownError))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  (200...299).contains(response.statusCode) else {
                completion(.failure(.responseError))
                return
            }
            
            guard let data else {
                completion(.failure(.dataError))
                return
            }

            JSONParser().parseData(type: type,
                                        data: data,
                                        completion: completion)
        }.resume()
    }
    
    private func getRequest(api: Router) throws -> URLRequest {
        guard var urlComponents = URLComponents(string: api.endPoint) else { throw WeatherError.wrongURL }
        urlComponents.queryItems = api.param.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        guard let url = urlComponents.url else { throw WeatherError.wrongURL }
        
        var request = URLRequest(url: url)
        request.httpMethod = api.method
        
        return request
    }
}
