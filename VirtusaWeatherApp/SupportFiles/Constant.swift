//
//  Constant.swift
//  VirtusaWeatherApp
//
//  Created by Praveen Saraswat on 29/03/23.
//

import Foundation
import UIKit
class Constants {
    
    class Strings {
        static let city = "Ohio"
        static let keyAPI = "a12b90eeca6938107b782f2811625d5a" //"e286a159a583b9251688d27bebc25783"
        static let url = "https://api.openweathermap.org/data/2.5"
    }
}

public func covertDate(_ date: String?) -> String {
    var fixDate = ""
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en_US_POSIX")
    dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    if let originalDate = date {
        if let newDate = dateFormatter.date(from: originalDate) {
            dateFormatter.dateFormat = "EEEE"
            fixDate = dateFormatter.string(from: newDate)
        }
    }
    return fixDate
}
