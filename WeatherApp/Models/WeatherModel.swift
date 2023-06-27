//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Gustavo Binder on 23/06/23.
//

import Foundation

struct WeatherModel
{
    var temperature: Measurement<UnitTemperature>
    var symbolName: String
    var precipitation: String
    var wind : Measurement<UnitSpeed>
    
    init(_ temperature: Measurement<UnitTemperature>, _ symbolName: String, _ precipitation: String, _ wind: Measurement<UnitSpeed>) {
        self.temperature = temperature
        self.symbolName = symbolName
        self.precipitation = precipitation
        self.wind = wind
    }
}
