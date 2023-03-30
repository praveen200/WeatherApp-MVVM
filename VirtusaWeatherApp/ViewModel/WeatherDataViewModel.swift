//
//  WeatherDataViewModel.swift
//  VirtusaWeatherApp
//
//  Created by Praveen Saraswat on 29/03/23.
//

import Foundation
import UIKit
import CoreLocation

protocol DataDelegate {
    func fetchCurrentDayData(_ data: WeatherResponse)
    func fetchFiveDayData(_ data: FiveDaysWeatherData)
}

extension DataDelegate {
    func fetchFiveDayData(_ data: FiveDaysWeatherData) {
        
    }
}


class WeatherDataViewModel {
    var weather = WeatherResponse.empty()
    var delegate: DataDelegate?
    var currentDay: CurrentDayWeatherData?
  //  let currentDayAPI : WeatherApiCurrent = WeatherApiCurrent.sharedInstance
  //  let weekDaysAPI : WeatherApiWeek = WeatherApiWeek.sharedInstance
    var fiveDaysData: FiveDaysWeatherData?
    var city = "Ohio" {
            didSet {
                getLocation()
            }
        }
    
    init() {
        getLocation()
    }
    
        private func getLocation() {
            CLGeocoder().geocodeAddressString(city) { (placemarks, error) in
                if let places = placemarks,
                   let place = places.first {
                    self.getWeather(coord: place.location?.coordinate)
                }
            }
        }
    
        private func getWeather(coord: CLLocationCoordinate2D?) {
            var urlString = ""
            if let coord = coord {
                urlString = WeatherApi.getCurrentWeatherURL(latitude: coord.latitude, longitude: coord.longitude)
            } else {
                urlString = WeatherApi.getCurrentWeatherURL(latitude: 53.9, longitude: 27.5667) // Minsk
            }
            getWeatherDaily(city: city, for: urlString)
        }
    
    
    private func getWeatherDaily(city: String, for urlString: String) {
        guard let url = URL(string: urlString) else {return}
        NetworkManager<WeatherResponse>.fetchWeather(for: url) { (result) in
            switch result {
                case .success(let response):
                    DispatchQueue.main.async {
                        self.delegate?.fetchCurrentDayData(response)
                        
//                        self.weather = response
                    }
                case .failure(let error):
                    print(error)
            }
        }
    }
    
    
    func getWeatherIconFor(icon: String) -> UIImage {
        switch icon {
            case "01d":
            return UIImage(named: "sun")!
            case "01n":
                return UIImage(named:"moon")!
            case "02d":
                return UIImage(named:"cloudSun")!
            case "02n":
                return UIImage(named:"cloudMoon")!
            case "03d":
                return UIImage(named:"cloud")!
            case "03n":
                return UIImage(named:"cloudMoon")!
            case "04d":
                return UIImage(named:"cloudMax")!
            case "04n":
                return UIImage(named:"cloudMoon")!
            case "09d":
                return UIImage(named:"rainy")!
            case "09n":
                return UIImage(named:"rainy")!
            case "10d":
                return UIImage(named:"rainySun")!
            case "10n":
                return UIImage(named:"rainyMoon")!
            case "11d":
                return UIImage(named:"thunderstormSun")!
            case "11n":
                return UIImage(named:"thunderstormMoon")!
            case "13d":
                return UIImage(named:"snowy")!
            case "13n":
                return UIImage(named:"snowy-2")!
            case "50d":
                return UIImage(named:"tornado")!
            case "50n":
                return UIImage(named:"tornado")!
            default:
                return UIImage(named:"sun")!
        }
    }

}


