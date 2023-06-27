//
//  SwiftUIView.swift
//  WeatherApp
//
//  Created by Murilo Correa Pasquim on 22/06/23.
//

import SwiftUI

struct WeatherView: View {
    @StateObject var wm = WeatherManager()
    @StateObject var lm = LocationManager()
    
    @State var flag = false
    @State var weatherKitError = false
    
    var body: some View {
        VStack (spacing: 16) {
            HStack() {
                Text("Hoje, 23 de jun.")
                    .font(.title2)
                    .fontWeight(.bold)
               
                Spacer()
                
                HStack {
                    Image(systemName: "location.fill")
                        .frame(width: 24, height: 24)
                    Text("\(lm.currentPlacemark?.subAdministrativeArea ?? "?"), \(lm.currentPlacemark?.administrativeArea ?? "?")")
                    
                }.foregroundColor(Color(uiColor: .systemBlue))
            }
            CardMaxView(weatherModel: $wm.morningWeather, period: "Manhã")
            CardMinView(weatherModel: $wm.eveningWeather, period: "Tarde")
            CardMinView(weatherModel: $wm.nightWeather, period: "Noite")
        }
        .padding(16)
        .background(Color(uiColor: .secondarySystemBackground))
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
        .alert(isPresented: $weatherKitError)
        {
            Alert(title: Text("Error"), message: Text("WeatherKit could not be accessed."), dismissButton: .default(Text("Ok")))
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
