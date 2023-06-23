//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Gustavo Binder on 23/06/23.
//

import WeatherKit
import CoreLocation

class WeatherManager : ObservableObject
{
    let weatherService = WeatherService.shared
    
    @Published var currentWeather = WeatherModel("--Cº", "square.dotted", "", "")
    @Published var morningWeather = WeatherModel("--Cº", "square.dotted", "", "")
    @Published var eveningWeather = WeatherModel("--Cº", "square.dotted", "", "")
    @Published var nightWeather = WeatherModel("--Cº", "square.dotted", "", "")
    
    func get_weather(lat: CLLocationDegrees, long: CLLocationDegrees) async
    {
        do {
            let weather = try await weatherService.weather(for: CLLocation(latitude: lat, longitude: long))
            let sunrise = weather.hourlyForecast.forecast[0]
            let morning = weather.hourlyForecast.forecast[9]
            let evening = weather.hourlyForecast.forecast[16]
            let night = weather.hourlyForecast.forecast[20]
            
            DispatchQueue.main.async {
                self.currentWeather.temperature = weather.currentWeather.apparentTemperature.formatted()
                self.currentWeather.symbolName = weather.currentWeather.symbolName
                self.currentWeather.precipitation = weather.currentWeather.condition.description
                self.currentWeather.wind = weather.currentWeather.wind.speed.description
                
                self.morningWeather.temperature = morning.apparentTemperature.formatted()
                self.morningWeather.symbolName = morning.symbolName
                self.morningWeather.precipitation = morning.precipitation.description
                self.morningWeather.wind = morning.wind.speed.description
                
                self.eveningWeather.temperature = evening.apparentTemperature.formatted()
                self.eveningWeather.symbolName = evening.symbolName
                self.eveningWeather.precipitation = evening.precipitation.description
                self.eveningWeather.wind = evening.wind.speed.description
                
                self.nightWeather.temperature = night.apparentTemperature.formatted()
                self.nightWeather.symbolName = night.symbolName
                self.nightWeather.precipitation = night.precipitation.description
                self.nightWeather.wind = night.wind.speed.description
            }
            
            print(sunrise)
        }
        catch
        {
            print("hello")
        }
    }
}
