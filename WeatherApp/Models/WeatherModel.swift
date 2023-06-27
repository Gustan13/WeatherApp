//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Gustavo Binder on 23/06/23.
//

import Foundation
import WeatherKit

struct WeatherModel
{
    var temperature: Measurement<UnitTemperature>
    var symbolName: String
    var precipitation: Measurement<UnitLength>
    var wind : Measurement<UnitSpeed>
    
    init(_ temperature: Measurement<UnitTemperature>, _ symbolName: String, _ precipitation: Measurement<UnitLength>, _ wind: Measurement<UnitSpeed>) {
        self.temperature = temperature
        self.symbolName = symbolName
        self.precipitation = precipitation
        self.wind = wind
    }
}
