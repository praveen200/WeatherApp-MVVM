//
//  APINetwork.swift
//  VirtusaWeatherApp
//
//  Created by Praveen Saraswat on 29/03/23.
//

import Foundation


struct WeatherApi {
    static let key = Constants.Strings.keyAPI
}

extension WeatherApi {
    static let baseURL = Constants.Strings.url
    
//https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=e286a159a583b9251688d27bebc25783


    static func getCurrentWeatherURL(latitude: Double, longitude: Double) -> String {
        let excludeFields = "minutely"
        return  "\(baseURL)/onecall?lat=\(latitude)&lon=\(longitude)&appid=\(key)&exclude=\(excludeFields)&units=metric"
        
       // "\(baseURL)/weather?lat=\(latitude)&lon=\(longitude)&appid=\(key)"
    }
}

final class NetworkManager<T: Codable> {
    static func fetchWeather(for url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard error == nil else {
                print(String(describing: error))
                if let error = error?.localizedDescription {
                    completion(.failure(.error(err: error)))
                }
                return
            }
            
            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            } catch let err {
                print(String(describing: err))
                completion(.failure(.decodingError(err: err.localizedDescription)))
            }
        }.resume()
    }
}

enum NetworkError: Error {
    case invalidResponse
    case invalidData
    case decodingError(err: String)
    case error(err: String)
}



