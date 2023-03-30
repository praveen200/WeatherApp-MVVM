//
//  WeatherResponse.swift
//  VirtusaWeatherApp
//
//  Created by Praveen Saraswat on 29/03/23.
//

import Foundation


struct Temperature: Codable {
    var min: Double
    var max: Double
}

struct WeatherDaily: Codable {
    var date: Int
    var temperature: Temperature
    var weather: [WeatherDetail]
    var id: UUID {
        UUID()
    }

    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case temperature = "temp"
        case weather = "weather"
    }

    init() {
        date = 0
        temperature = Temperature(min: 0.0, max: 0.0)
        weather = [WeatherDetail(main: "",
                                 description: "",
                                 icon: "")]
    }
}

struct WeatherResponse: Codable {
    var current: WeatherData
    var hourly: [WeatherData]
    var daily: [WeatherDaily]

    static func empty() -> WeatherResponse {
        WeatherResponse(
            current: WeatherData(),
            hourly: [WeatherData](repeating: WeatherData(),
                              count: 24),
            daily: [WeatherDaily](repeating: WeatherDaily(),
                                  count: 8)
        )
    }
}
