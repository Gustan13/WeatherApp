//
//  SwiftUIView.swift
//  WeatherApp
//
//  Created by Murilo Correa Pasquim on 22/06/23.
//

import SwiftUI

let dia = [Color("amareloTempo"), Color("laranjaTempo")]
let tarde = [Color("laranjaTempo"), Color("rosaTempo")]
let noite = [Color("rosaTempo"), Color("azulTempo")]

struct WeatherView: View {
    
    static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "d 'de' MMM"
        formatter.locale = Locale(identifier: "pt_BR")
        return formatter
    }()
    
    @State var morningActive: Bool = true
    @State var eveningActive: Bool = false
    @State var nightActive: Bool = false
    
    @State var morningActive1: Bool = true
    @State var eveningActive1: Bool = false
    @State var nightActive1: Bool = false
//    var anime: Animation = .
    
    @StateObject var wm = WeatherManager()
    @StateObject var lm = LocationManager()
    
    @State var flag = false
    @State var weatherKitError = false
    
    @State var current_colors : [Color] = dia
    
    var body: some View {
        let currentDate = Date()
        let dateString = WeatherView.dateFormatter.string(from: currentDate)
        
        VStack (spacing: 16) {
            HStack() {
                Text("Hoje, \(dateString)")
                    .font(.title2)
                    .fontWeight(.bold)
               
                Spacer()
                
                HStack {
                    Image(systemName: "location.fill")
                        .frame(width: 24, height: 24)
                    Text("\(lm.currentPlacemark?.subAdministrativeArea ?? "?"), \(lm.currentPlacemark?.administrativeArea ?? "?")")
                    
                }.foregroundColor(Color(uiColor: .systemBlue))
            }
            
            CardView(weatherModel: $wm.morningWeather, period: "Manhã", active: morningActive1)
                .frame(maxWidth: .infinity, maxHeight: morningActive ? .infinity : nil, alignment: .topLeading)
                .onTapGesture {
                    withAnimation(.easeInOut){
                        current_colors = dia
                        morningActive = true
                        eveningActive = false
                        nightActive = false
                        morningActive1 = true
                        eveningActive1 = false
                        nightActive1 = false
                    }
                }
            CardView(weatherModel: $wm.eveningWeather, period: "Tarde", active: eveningActive1)
                .frame(maxWidth: .infinity, maxHeight: eveningActive ? .infinity : nil, alignment: .center)
                .onTapGesture {
                    withAnimation(.easeInOut){
                        current_colors = tarde
                        eveningActive = true
                        morningActive = false
                        nightActive = false
                        morningActive1 = false
                        eveningActive1 = true
                        nightActive1 = false
                    }
                }
            CardView(weatherModel: $wm.nightWeather, period: "Noite", active: nightActive1)
                .frame(maxWidth: .infinity, maxHeight: nightActive ? .infinity : nil, alignment: .bottomLeading)
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        current_colors = noite
                        nightActive = true
                        morningActive = false
                        eveningActive = false
                        morningActive1 = false
                        eveningActive1 = false
                        nightActive1 = true
                    }
                }
        }
        .padding(16)
        .background(.radialGradient(Gradient(colors: current_colors), center: .topLeading, startRadius: 0, endRadius: 1000))
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
