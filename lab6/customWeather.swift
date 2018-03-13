//
//  customWeather.swift
//  lab6
//
//  Created by Max Moede on 2/12/18.
//  Copyright © 2018 Max Moede. All rights reserved.
//

import Foundation

class customWeather {
    var conditions : String?
    var high : String?
    var low : String?
    var aveWindDir : String?
    var aveWindSpeed : String?
    var maxWindDir : String?
    var maxWindSpeed : String?
    var date : String?
    
    init (conditions: String, high: String, low: String){
        self.conditions = conditions
    }
}
