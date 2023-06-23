//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Gustavo Binder on 23/06/23.
//

struct WeatherModel
{
    var temperature: String
    var symbolName: String
    var precipitation: String
    var wind : String
    
    init(_ temperature: String, _ symbolName: String, _ precipitation: String, _ wind: String) {
        self.temperature = temperature
        self.symbolName = symbolName
        self.precipitation = precipitation
        self.wind = wind
    }
}
