//
//  ContentView.swift
//  WeatherApp
//
//  Created by Gustavo Binder on 21/06/23.
//

import SwiftUI
import WeatherKit
import CoreLocation

struct CurrentWeather
{
    var temperature: String
    var symbolName: String
}

class WeatherManager : ObservableObject
{
    var currentWeather : CurrentWeather!
    private let weatherService = WeatherService()
    
    func getWeather() async
    {
        let syracuse = CLLocation(latitude: -25, longitude: -49)
        
        let weather = try? await weatherService.weather(for: syracuse)
        if let weather = weather
        {
            let temperature = weather.currentWeather.temperature
            let symbol = weather.currentWeather.symbolName
            currentWeather = CurrentWeather(temperature: temperature.formatted(), symbolName: symbol)
        }
        currentWeather = CurrentWeather(temperature: "--Cº", symbolName: "square.dotted")
    }
}

struct ContentView: View {
    
    @State var currentWeather = CurrentWeather(temperature: "--Fº", symbolName: "square.dotted")
    let weatherService = WeatherService.shared
    
    var body: some View {
        VStack {
            Text(currentWeather.temperature)
                .font(.largeTitle)
                .padding()
            Image(systemName: currentWeather.symbolName)
                .font(.largeTitle)
        }
        .padding()
        .task {
            do {
                let weather = try await weatherService.weather(for: CLLocation(latitude: -25, longitude: -49))
                currentWeather.temperature = weather.currentWeather.temperature.formatted()
                currentWeather.symbolName = weather.currentWeather.symbolName
            }
            catch
            {
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
