//
//  textForecastService.swift
//  lab6
//
//  Created by Max Moede on 2/8/18.
//  Copyright © 2018 Max Moede. All rights reserved.
//

import Foundation

struct textForecastService : Codable {
    let forecast : Forecast
    
    struct Forecast: Codable {
        let simpleforecast : weatherClass
    }
    
}
