//
//  ViewController.swift
//  VirtusaWeatherApp
//
//  Created by Praveen Saraswat on 28/03/23.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet weak var upperPartCurrent: UILabel!
    @IBOutlet weak var currentWeatherLabel: UILabel!
    @IBOutlet weak var currentWeatherMin: UILabel!
    @IBOutlet weak var currentWeatherLower: UILabel!
    @IBOutlet weak var currentWeatherMax: UILabel!
    @IBOutlet weak var dayOne: UILabel!
    @IBOutlet weak var dayTwo: UILabel!
    @IBOutlet weak var dayThree: UILabel!
    @IBOutlet weak var dayFour: UILabel!
    @IBOutlet weak var dayFive: UILabel!
    @IBOutlet weak var dayOneWeather: UILabel!
    @IBOutlet weak var dayTwoWeather: UILabel!
    @IBOutlet weak var dayThreeWeather: UILabel!
    @IBOutlet weak var dayFourWeather: UILabel!
    @IBOutlet weak var dayFiveWeather: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var currentView: UIView!
    @IBOutlet weak var weekView: UIView!
    @IBOutlet var dayOneWeatherIcon: UIImageView!
    @IBOutlet var dayTwoWeatherIcon: UIImageView!
    @IBOutlet var dayThreeWeatherIcon: UIImageView!
    @IBOutlet var dayFourWeatherIcon: UIImageView!
    @IBOutlet var dayFiveWeatherIcon: UIImageView!
    @IBOutlet weak var userSearchBar: UISearchBar!
    
    var viewModel = WeatherDataViewModel()
    var details : WeatherResponse?
    var fiveDays : FiveDaysWeatherData?


    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
    }

}

extension WeatherViewController: DataDelegate {
    
    func fetchCurrentDayData(_ data: WeatherResponse) {
        self.details = data
       // print(self.details)
        self.upperPartCurrent.text = "\(Int(details!.current.temperature))˚"
        self.currentWeatherLower.text = "\(Int(details!.current.temperature))˚"
        self.currentWeatherMin.text = "\(Int(details!.daily[0].temperature.min))˚"
        self.currentWeatherMax.text = "\(Int(details!.daily[0].temperature.max))˚"
        
      switch  details!.current.weather[0].main {
        case "Clouds":
            self.currentWeatherLabel.text = "CLOUDY"
          self.currentWeatherImage.image = viewModel.getWeatherIconFor(icon: details!.current.weather[0].icon)
            self.dayOneWeatherIcon.image = UIImage(named: "partlysunny")
            self.dayTwoWeatherIcon.image = UIImage(named: "partlysunny")
            self.dayThreeWeatherIcon.image = UIImage(named: "partlysunny")
            self.dayFourWeatherIcon.image = UIImage(named: "partlysunny")
            self.dayFiveWeatherIcon.image = UIImage(named: "partlysunny")
            self.view.backgroundColor = #colorLiteral(red: 0.3725490196, green: 0.5176470588, blue: 0.5921568627, alpha: 1)
        case "Rain":
            self.currentWeatherLabel.text = "RAINY"
            self.currentWeatherImage.image = viewModel.getWeatherIconFor(icon: details!.current.weather[0].icon)
            self.dayOneWeatherIcon.image = UIImage(named: "rain")
            self.dayTwoWeatherIcon.image = UIImage(named: "rain")
            self.dayThreeWeatherIcon.image = UIImage(named: "rain")
            self.dayFourWeatherIcon.image = UIImage(named: "rain")
            self.dayFiveWeatherIcon.image = UIImage(named: "rain")
            self.view.backgroundColor = #colorLiteral(red: 0.45107162, green: 0.4469693899, blue: 0.4510948062, alpha: 1)
            
        case "Clear":
            self.currentWeatherLabel.text = "SUNNY"
            self.currentWeatherImage.image = viewModel.getWeatherIconFor(icon: details!.current.weather[0].icon)
            self.dayOneWeatherIcon.image = UIImage(named: "clear")
            self.dayTwoWeatherIcon.image = UIImage(named: "clear")
            self.dayThreeWeatherIcon.image = UIImage(named: "clear")
            self.dayFourWeatherIcon.image = UIImage(named: "clear")
            self.dayFiveWeatherIcon.image = UIImage(named: "clear")
            self.view.backgroundColor = #colorLiteral(red: 0.9467127919, green: 0.730097115, blue: 0.07246615738, alpha: 1)
        default:
            return
        }
    }
}



extension WeatherViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.city = searchBar.text!

    }
 
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
////        viewModel.getGithubUser(searchText: searchText)
//    }
}
