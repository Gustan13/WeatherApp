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
    
    @AppStorage("onBoarding") var onBoarding : Bool = true
    @State var canContinue : Bool = false
    
    @Namespace var namespace
    
    var body: some View {
        
        ZStack(){
            if lm.locationStatus == .authorizedAlways || lm.locationStatus == .authorizedWhenInUse {
                if onBoarding {
                    switch(currentTab){
                    case 1:
                        LocationInstructionView(tabSelected: $currentTab)
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
                } else {
                    WeatherView()
                }
            } else {
                LocationBlurView(tabSelected: $currentTab, lm: lm)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
