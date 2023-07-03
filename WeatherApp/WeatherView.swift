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
    var anime: Animation = .spring()
    
    @StateObject var wm = WeatherManager()
    @StateObject var lm = LocationManager()
    
    @State var flag = false
    @State var weatherKitError = false
    
    @State var current_colors : [Color] = dia
    
    @State var currentDate = Date()
    @State var today = Date()
    
    @State var hour : Int!
    
    @State var dayHour : Int = UserDefaults.standard.integer(forKey: "dayHour")
    @State var eveningHour : Int = UserDefaults.standard.integer(forKey: "eveningHour")
    @State var nightHour : Int = UserDefaults.standard.integer(forKey: "nightHour")
    
    var body: some View {

        let dateString = WeatherView.dateFormatter.string(from: currentDate)
        
        VStack (spacing: 16) {
            HStack() {
                Text("Hoje, \(dateString)")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
               
                Spacer()
                
                HStack {
                    Image(systemName: "location.fill")
                        .frame(width: 24, height: 24)
                    Text("\(lm.currentPlacemark?.subAdministrativeArea ?? "?"), \(lm.currentPlacemark?.administrativeArea ?? "?")")
                    
                }.foregroundColor(.white)
            }
            
            CardView(weatherModel: $wm.morningWeather, period: "Manhã", active: morningActive1, horario: 8, h: $dayHour, date: Calendar.current.date(bySettingHour: dayHour, minute: 0, second: 0, of: Date()) ?? Date())
                .frame(maxWidth: .infinity, maxHeight: morningActive ? .infinity : nil, alignment: .topLeading)
                .onTapGesture {
                    withAnimation(anime){
                        current_colors = dia
                        morningActive = true
                        eveningActive = false
                        nightActive = false
                        morningActive1 = true
                        eveningActive1 = false
                        nightActive1 = false
                    }
                }
                .onChange(of: dayHour) { newValue in
                    get_weather_info(newValue, eveningHour, nightHour)
                    print("updated day time")
                }
            CardView(weatherModel: $wm.eveningWeather, period: "Tarde", active: eveningActive1, horario: 16, h: $eveningHour, date: Calendar.current.date(bySettingHour: eveningHour, minute: 0, second: 0, of: Date())!)
                .frame(maxWidth: .infinity, maxHeight: eveningActive ? .infinity : nil, alignment: .center)
                .onTapGesture {
                    withAnimation(anime){
                        current_colors = tarde
                        eveningActive = true
                        morningActive = false
                        nightActive = false
                        morningActive1 = false
                        eveningActive1 = true
                        nightActive1 = false
                    }
                }
                .onChange(of: eveningHour) { newValue in
                    get_weather_info(dayHour, newValue, nightHour)
                    print("updated evening time")
                }
            CardView(weatherModel: $wm.nightWeather, period: "Noite", active: nightActive1, horario: 20, h: $nightHour, date: Calendar.current.date(bySettingHour: nightHour, minute: 0, second: 0, of: Date()) ?? Date())
                .frame(maxWidth: .infinity, maxHeight: nightActive ? .infinity : nil, alignment: .bottomLeading)
                .onTapGesture {
                    withAnimation(anime) {
                        current_colors = noite
                        nightActive = true
                        morningActive = false
                        eveningActive = false
                        morningActive1 = false
                        eveningActive1 = false
                        nightActive1 = true
                    }
                }
                .onChange(of: nightHour) { newValue in
                    get_weather_info(dayHour, eveningHour, newValue)
                    print("updated night time")
                }
        }
        .padding(16)
        .background(.radialGradient(Gradient(colors: current_colors), center: .topLeading, startRadius: 0, endRadius: 1000))
        .onAppear
        {
            startUpdatingDate()
            
            withAnimation(.spring())
            {
                print(hour!)
                if(hour <= 10) {
                    current_colors = dia
                    
                    morningActive = true
                    eveningActive = false
                    nightActive = false
                    
                    morningActive1 = true
                    eveningActive1 = false
                    nightActive1 = false
                } else if (hour <= 16) {
                    current_colors = tarde
                    
                    morningActive = false
                    eveningActive = true
                    nightActive = false
                    
                    morningActive1 = false
                    eveningActive1 = true
                    nightActive1 = false
                } else {
                    current_colors = noite
                    
                    morningActive = false
                    eveningActive = false
                    nightActive = true
                    
                    morningActive1 = false
                    eveningActive1 = false
                    nightActive1 = true
                }
            }
        }
        .task {
            get_weather_info(dayHour, eveningHour, nightHour)
        }
        .alert(isPresented: $weatherKitError)
        {
            Alert(title: Text("Error"), message: Text("WeatherKit could not be accessed."), dismissButton: .default(Text("Ok")))
        }
        .preferredColorScheme(ColorScheme.light)
    }
    
    private func startUpdatingDate() {
        let calendar = Calendar.current
        hour = calendar.component(.hour, from: currentDate)
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            currentDate = Date()
            
            let day_iterator = calendar.component(.day, from: currentDate)
            let day_buffer = calendar.component(.day, from: today)
            hour = calendar.component(.hour, from: currentDate)
            
            if day_iterator != day_buffer
            {
                get_weather_info(dayHour, eveningHour, nightHour)
                
                today = Date()
            }
        }
    }
    
    private func get_weather_info(_ d: Int, _ e: Int, _ n: Int)
    {
        Task {
            if (lm.locationStatus == .none)
            {
                return
            }
            
            if (lm.locationStatus == .authorizedAlways || lm.locationStatus == .authorizedWhenInUse)
            {
                print("in")
                weatherKitError = await wm.get_weather(lat: lm.lastLocation?.coordinate.latitude ?? -25, long: lm.lastLocation?.coordinate.longitude ?? -49, dayHour, eveningHour, nightHour)
                lm.stop()
                print("flag")
            }
            print("Hello")
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherView()
    }
}
