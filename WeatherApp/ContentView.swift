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
    @StateObject var lm = LocationManager()
    
    @State var flag = false
    @State var weatherKitError = false
    
    var body: some View {
        VStack {
            Text("WeatherApp")
                .font(.largeTitle)
            Text("\(lm.currentPlacemark?.subAdministrativeArea ?? "")")
                .padding(.bottom)
            Text("\(lm.lastLocation?.coordinate.latitude ?? 0), \(lm.lastLocation?.coordinate.longitude ?? 0)")
            
            Text("\(wm.currentWeather.temperature)")
            
            VStack {
                Text("Manhã")
                Text(wm.morningWeather.temperature.formatted())
                    .font(.largeTitle)
                Image(systemName: wm.morningWeather.symbolName)
                    .font(.largeTitle)
                Text(wm.morningWeather.precipitation.description)
                Text(wm.morningWeather.wind.formatted())
                    .padding(.bottom)
            }
            VStack {
                Text("Tarde")
                Text(wm.eveningWeather.temperature.formatted())
                    .font(.largeTitle)
                Image(systemName: wm.eveningWeather.symbolName)
                    .font(.largeTitle)
                Text(wm.eveningWeather.precipitation.description)
                Text(wm.eveningWeather.wind.formatted())
                    .padding(.bottom)
            }
            VStack {
                Text("Noite")
                Text(wm.nightWeather.temperature.formatted())
                    .font(.largeTitle)
                Image(systemName: wm.nightWeather.symbolName)
                    .font(.largeTitle)
                Text(wm.nightWeather.precipitation.description)
                Text(wm.nightWeather.wind.formatted())
                    .padding(.bottom)
            }
        }
        .alert(isPresented: $weatherKitError)
        {
            Alert(title: Text("Error"), message: Text("WeatherKit could not be accessed."), dismissButton: .default(Text("Ok")))
        }
        .padding()
        .task {
            if (lm.locationStatus == .none)
            {
                return
            }
            
            if (lm.locationStatus == .authorizedAlways || lm.locationStatus == .authorizedWhenInUse)
            {
                print("in")
                weatherKitError = await wm.get_weather(lat: lm.lastLocation?.coordinate.latitude ?? -25, long: lm.lastLocation?.coordinate.longitude ?? -49)
                lm.stop()
                print("flag")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
