//
//  WeatherData.swift
//  VirtusaWeatherApp
//
//  Created by Praveen Saraswat on 29/03/23.
//

import Foundation

struct WeatherDetail: Codable {
    var main: String
    var description: String
    var icon: String
    var id: Int {
        0
    }
}

struct WeatherData: Codable {
    var date: Int
    var temperature: Double
    var feelsLike: Double
    var pressure: Int
    var humidity: Int
    var dewPoint: Double
    var clouds: Int
    var windSpeed: Double
    var windDeg: Int
    var weather: [WeatherDetail]
    var id: UUID {
        UUID()
    }

    enum CodingKeys: String, CodingKey {
        case date = "dt"
        case temperature = "temp"
        case feelsLike = "feels_like"
        case pressure = "pressure"
        case humidity = "humidity"
        case dewPoint = "dew_point"
        case clouds = "clouds"
        case windSpeed = "wind_speed"
        case windDeg = "wind_deg"
        case weather = "weather"
    }

    init() {
        date = 0
        temperature = 0.0
        feelsLike = 0.0
        pressure = 0
        humidity = 0
        dewPoint = 0.0
        clouds = 0
        windSpeed = 0.0
        windDeg = 0
        weather = []
    }
}


// MARK: - CurrentDayWeatherData
struct CurrentDayWeatherData: Codable {
    let coord: Coord
    let weather: [Weather]
    let base: String
    let main: Main
    let visibility: Int
    let wind: Wind
    let clouds: Clouds
    let dt: Int
    let sys: Sys
    let timezone, id: Int
    let name: String
    let cod: Int
}

// MARK: - Clouds
struct Clouds: Codable {
    let all: Int
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
    let country: String
    let sunrise, sunset: Int
}

// MARK: - Weather
struct Weather: Codable {
    let id: Int
    let main, weatherDescription, icon: String
    
    enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Wind
struct Wind: Codable {
    let speed: Double
    let deg: Int
    let gust: Double
}



// MARK: - FiveDaysWeatherData
struct FiveDaysWeatherData: Codable {
    let list: [List]
}
// MARK: - List
struct List: Codable {
    let date: String
    let main: MainClass
    let weather: [Weather2]
    enum CodingKeys: String, CodingKey{
        case date = "dt_txt"
        case main
        case weather
    }
}
// MARK: - Main
struct MainClass: Codable {
    let temp: Double
}
// MARK: - Weather
struct Weather2: Codable {
    let main: String
}
