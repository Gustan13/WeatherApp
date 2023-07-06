//
//  ContentView.swift
//  WeatherApp
//
//  Created by Andrea Oquendo on 04/07/23.
//

import SwiftUI

struct ContentView: View {
    @GestureState private var swipeOffset: CGFloat = 0
    @State private var currentTab = 1
    @StateObject var lm = LocationManager()
    @State var onBoarding: Bool = true
    
    @Namespace var namespace
    
    var body: some View {
        
        ZStack(){
            
            if (onBoarding == false){
                WeatherView()
            }
            else {
                ZStack(){
                    switch(currentTab){
                    case 1:
                        if lm.locationStatus == .authorizedAlways || lm.locationStatus == .authorizedWhenInUse
                        {
                            LocationInstructionView(tabSelected: $currentTab)
                        } else {
                            LocationBlurView(tabSelected: $currentTab)
                        }
                    case 2:
                        CardInstructionView(tabSelected: $currentTab)
                    case 3:
                        HorarioInstructionView(tabSelected: $currentTab)
                    case 4:
                        MiniCardInstruction(tabSelected: $currentTab)
                    case 5:
                        WeatherView()
                    default:
                        WeatherView()
                    }
                }
            }
            
        }.onAppear{
            lm.requestLocationAlways()
            if (lm.locationStatus == .authorizedAlways || lm.locationStatus == .authorizedWhenInUse){
                onBoarding = false
            }
            print(currentTab)
        }
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
