//
//  weatherClass.swift
//  lab6
//
//  Created by Max Moede on 2/8/18.
//  Copyright © 2018 Max Moede. All rights reserved.
//

import Foundation

struct weatherClass : Codable {
    //var date: String
    var forecastDays : [ForecastDay]
    
    private enum CodingKeys: String, CodingKey {
        case forecastDays = "forecastday"
    }
    
    struct ForecastDay : Codable {
        var period : Int
        var conditions : String
        var aveWindVal: avewind
        var maxWindVal: maxwind
        var dateVal: date
        var low : low
        var high : high
        var iconUrl : String
        
        private enum CodingKeys: String, CodingKey {
            case period
            case conditions
            case low
            case high
            case aveWindVal = "avewind"
            case maxWindVal = "maxwind"
            case dateVal = "date"
            case iconUrl = "icon_url"
            //case forecastText = "fcttext"
        }
    }
    
    struct avewind : Codable {
        var dir : String
        var kph : Int
        var degrees : Int
        var mph : Int
        
        private enum CodingKeys: String, CodingKey {
            case dir
            case kph
            case degrees
            case mph
        }
    }
    
    struct maxwind : Codable {
        var dir : String
        var kph : Int
        var degrees : Int
        var mph : Int
        
        private enum CodingKeys: String, CodingKey {
            case dir
            case kph
            case degrees
            case mph
        }
    }
    
    struct date : Codable {
        var monthname_short : String
        var day : Int
        var year : Int
        
        private enum CodingKeys: String, CodingKey {
            case monthname_short
            case day
            case year
        }
    }
    
    struct low : Codable {
        var fahrenheit : String
        
        private enum CodingKeys: String, CodingKey {
            case fahrenheit
        }
    }
    
    struct high : Codable {
        var fahrenheit : String
        
        private enum CodingKeys: String, CodingKey {
            case fahrenheit
        }
    }
    

    
}
