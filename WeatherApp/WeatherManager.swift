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
    
    @Published var currentWeather = WeatherModel(Measurement(value: 0, unit: UnitTemperature.celsius), "square.dotted", Measurement(value: 0, unit: UnitLength.millimeters), Measurement(value: 0, unit: UnitSpeed.kilometersPerHour))
    @Published var morningWeather = WeatherModel(Measurement(value: 0, unit: UnitTemperature.celsius), "square.dotted", Measurement(value: 0, unit: UnitLength.millimeters), Measurement(value: 0, unit: UnitSpeed.kilometersPerHour))
    @Published var eveningWeather = WeatherModel(Measurement(value: 0, unit: UnitTemperature.celsius), "square.dotted", Measurement(value: 0, unit: UnitLength.millimeters), Measurement(value: 0, unit: UnitSpeed.kilometersPerHour))
    @Published var nightWeather = WeatherModel(Measurement(value: 0, unit: UnitTemperature.celsius), "square.dotted", Measurement(value: 0, unit: UnitLength.millimeters), Measurement(value: 0, unit: UnitSpeed.kilometersPerHour))
    
    func get_weather(lat: CLLocationDegrees, long: CLLocationDegrees, _ dh: Int, _ eh: Int, _ nh: Int) async -> Bool
    {
        do {
            let weather = try await weatherService.weather(for: CLLocation(latitude: lat, longitude: long))
            let morning = weather.hourlyForecast.forecast[dh]
            let evening = weather.hourlyForecast.forecast[eh]
            let night = weather.hourlyForecast.forecast[nh]
            
            print("\(dh), \(eh) e \(nh)")
            
            DispatchQueue.main.async {
                self.currentWeather.temperature = weather.currentWeather.apparentTemperature.converted(to: .celsius)
                self.currentWeather.symbolName = weather.currentWeather.symbolName
                self.currentWeather.wind = weather.currentWeather.wind.speed
                
                self.morningWeather.temperature = morning.apparentTemperature.converted(to: .celsius)
                self.morningWeather.symbolName = morning.symbolName
                self.morningWeather.precipitation = morning.precipitationAmount
                self.morningWeather.wind = morning.wind.speed
                
                self.eveningWeather.temperature = evening.apparentTemperature.converted(to: .celsius)
                self.eveningWeather.symbolName = evening.symbolName
                self.eveningWeather.precipitation = evening.precipitationAmount
                self.eveningWeather.wind = evening.wind.speed
                
                self.nightWeather.temperature = night.apparentTemperature.converted(to: .celsius)
                self.nightWeather.symbolName = night.symbolName
                self.nightWeather.precipitation = night.precipitationAmount
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
