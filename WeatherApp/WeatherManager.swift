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
    
    @Published var currentWeather = WeatherModel(Measurement(value: 0, unit: UnitTemperature.celsius), "square.dotted", "", Measurement(value: 0, unit: UnitSpeed.kilometersPerHour))
    @Published var morningWeather = WeatherModel(Measurement(value: 0, unit: UnitTemperature.celsius), "square.dotted", "", Measurement(value: 0, unit: UnitSpeed.kilometersPerHour))
    @Published var eveningWeather = WeatherModel(Measurement(value: 0, unit: UnitTemperature.celsius), "square.dotted", "", Measurement(value: 0, unit: UnitSpeed.kilometersPerHour))
    @Published var nightWeather = WeatherModel(Measurement(value: 0, unit: UnitTemperature.celsius), "square.dotted", "", Measurement(value: 0, unit: UnitSpeed.kilometersPerHour))
    
    func get_weather(lat: CLLocationDegrees, long: CLLocationDegrees) async -> Bool
    {
        do {
            let weather = try await weatherService.weather(for: CLLocation(latitude: lat, longitude: long))
            let morning = weather.hourlyForecast.forecast[9]
            let evening = weather.hourlyForecast.forecast[16]
            let night = weather.hourlyForecast.forecast[20]
            
            DispatchQueue.main.async {
                self.currentWeather.temperature = weather.currentWeather.apparentTemperature.converted(to: .celsius)
                self.currentWeather.symbolName = weather.currentWeather.symbolName
                self.currentWeather.precipitation = weather.currentWeather.condition.description
                self.currentWeather.wind = weather.currentWeather.wind.speed
                
                self.morningWeather.temperature = morning.apparentTemperature.converted(to: .celsius)
                print("\(self.morningWeather.temperature.formatted())")
                self.morningWeather.symbolName = morning.symbolName
                self.morningWeather.precipitation = morning.precipitation.description
                self.morningWeather.wind = morning.wind.speed
                
                self.eveningWeather.temperature = evening.apparentTemperature.converted(to: .celsius)
                self.eveningWeather.symbolName = evening.symbolName
                self.eveningWeather.precipitation = evening.precipitation.description
                self.eveningWeather.wind = evening.wind.speed
                
                self.nightWeather.temperature = night.apparentTemperature.converted(to: .celsius)
                self.nightWeather.symbolName = night.symbolName
                self.nightWeather.precipitation = night.precipitation.description
                self.nightWeather.wind = night.wind.speed
            }
            
            return false
        }
        catch
        {
            return true
        }
    }
}
