//
//  ContentView.swift
//  WeatherApp
//
//  Created by Gustavo Binder on 21/06/23.
//

import SwiftUI
import WeatherKit
import CoreLocation

struct ContentView: View {
    
    @StateObject var wm = WeatherManager()
    
    var body: some View {
        VStack {
            Text("WeatherApp")
                .font(.largeTitle)
                .padding(.bottom)
            VStack {
                Text("Manhã")
                Text(wm.morningWeather.temperature)
                    .font(.largeTitle)
                Image(systemName: wm.morningWeather.symbolName)
                    .font(.largeTitle)
                Text(wm.morningWeather.precipitation)
                Text(wm.morningWeather.wind)
                    .padding(.bottom)
            }
            VStack {
                Text("Tarde")
                Text(wm.eveningWeather.temperature)
                    .font(.largeTitle)
                Image(systemName: wm.eveningWeather.symbolName)
                    .font(.largeTitle)
                Text(wm.eveningWeather.precipitation)
                Text(wm.eveningWeather.wind)
                    .padding(.bottom)
            }
            VStack {
                Text("Noite")
                Text(wm.nightWeather.temperature)
                    .font(.largeTitle)
                Image(systemName: wm.nightWeather.symbolName)
                    .font(.largeTitle)
                Text(wm.nightWeather.precipitation)
                Text(wm.nightWeather.wind)
                    .padding(.bottom)
            }
        }
        .padding()
        .task {
            await wm.get_weather()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
