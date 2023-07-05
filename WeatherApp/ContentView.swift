//
//  ContentView.swift
//  WeatherApp
//
//  Created by Andrea Oquendo on 04/07/23.
//

import SwiftUI

struct ContentView: View {
    @GestureState private var swipeOffset: CGFloat = 0
    @State private var currentTab = 0
    var lm = LocationManager()
    @State var onBoarding: Bool = true
    
    @Namespace var namespace
    
    var body: some View {
        let transition2 = AnyTransition.asymmetric(insertion: .push(from: .trailing), removal: .slide).combined(with: .opacity)
        let transition = AnyTransition.push(from: .trailing)
        
        ZStack(){
            
            if (onBoarding == false){
                WeatherView()
            }
            else {
                ZStack(){
                    switch(currentTab){
                    case 0:
                        LocationBlurView(tabSelected: $currentTab)
//                            .transition(transition)
                            .matchedGeometryEffect(id: "place", in: namespace)
                    case 1:
                        LocationMoreBlurView(tabSelected: $currentTab)
//                            .transition(transition)
                            .matchedGeometryEffect(id: "place", in: namespace)
                    case 2:
                        LocationInstructionView(tabSelected: $currentTab)
//                            .transition(transition)
                            .matchedGeometryEffect(id: "place", in: namespace)
                    case 3:
                        CardInstructionView(tabSelected: $currentTab)
//                            .transition(transition)
                            .matchedGeometryEffect(id: "place", in: namespace)
                    case 4:
                        HorarioInstructionView(tabSelected: $currentTab)
//                            .transition(transition)
                            .matchedGeometryEffect(id: "place", in: namespace)
                    case 5:
                        MiniCardInstruction(tabSelected: $currentTab)
//                            .transition(transition)
                            .matchedGeometryEffect(id: "place", in: namespace)
                    case 6:
                        WeatherView()
                    default:
                        WeatherView()
                    }
                }
                .gesture(
                    DragGesture()
                        .updating($swipeOffset) { value, state, _ in
                            state = value.translation.width
                        }
                        .onEnded { value in
                            let threshold = UIScreen.main.bounds.width / 2
                            if -value.translation.width > threshold {
                                withAnimation(.default)
                                {
                                    if currentTab < 6 {
                                        currentTab = currentTab + 1
                                    }
                                }
                            }
                        }
                )
                
            }
        }.onAppear{
            if (lm.locationStatus == .authorizedAlways || lm.locationStatus == .authorizedWhenInUse){
                onBoarding = false
            }
        }
        
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
