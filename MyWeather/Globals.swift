//
//  Globals.swift
//  MyWeather
//
//  Created by Michel Schoemaker on 12/1/16.
//  Copyright © 2016 Michel Schoemaker. All rights reserved.
//

import Foundation
import UIKit

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LAT = "&lat=37.7"
let LON = "&lon=-122.4"
let WEATHER_API_KEY = "c7245aecffd09e2c56db168265da0e14"
let WEATHER_URL = "\(BASE_URL)appid=\(WEATHER_API_KEY)\(LAT)\(LON)"

typealias DownloadComplete = () -> () 

func hexStringToUIColor (hex:String) -> UIColor {
    
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    //remove #, if present
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    //check hex color has proper length, otherwise return UIColor gray
    if ((cString.characters.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt32 = 0
    Scanner(string: cString).scanHexInt32(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

extension UIColor {
    
    class var myPurple: UIColor {return hexStringToUIColor(hex: "5A4979")}
    class var myBlue: UIColor {return hexStringToUIColor(hex: "79C2CA")}
    class var myOrange: UIColor {return hexStringToUIColor(hex: "F3BD95")}
    class var myPink: UIColor {return hexStringToUIColor(hex: "F2BFBF")}
    
}
