//
//  SingletonClass.swift
//  HW9
//
//  Created by Justin Lee on 11/22/21.
//

import UIKit

class SingletonClass {
    static let shared = SingletonClass()
    var sharedUser = userObject()
    var locationGranted: Bool?
    private init(){}
    func requestForUser() -> userObject{
        
        return self.sharedUser
    }
}

class userObject{
    var fname = ""
    var startTime = ""
    var pressureSeaLevel = ""
    var cloudCover = ""
    var temperature = ""
    var temperatureMax = ""
    var temperatureMin = ""
    var weatherCode = ""
    var windDirection = ""
    var windSpeed = ""
    var precipitationProbability = ""
    var precipitationType = ""
    var humidity = ""
    var visibility = ""
    var sunriseTime = ""
    var sunsetTime = ""
    var uvIndex = ""
    var a0 = ""
    var a1 = ""
    var a2 = ""
    var a3 = ""
    var a4 = ""
    var a5 = ""
    var a6 = ""
    var a7 = ""
    var a8 = ""
    var a9 = ""
    var a10 = ""
    var a11 = ""
    var a12 = ""
    var a13 = ""
    var a14 = ""
    var b0 = ""
    var b1 = ""
    var b2 = ""
    var b3 = ""
    var b4 = ""
    var b5 = ""
    var b6 = ""
    var b7 = ""
    var b8 = ""
    var b9 = ""
    var b10 = ""
    var b11 = ""
    var b12 = ""
    var b13 = ""
    var b14 = ""
    
}
