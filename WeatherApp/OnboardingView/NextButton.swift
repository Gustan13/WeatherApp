//
//  NextButton.swift
//  WeatherApp
//
//  Created by Gustavo Binder on 06/07/23.
//

import SwiftUI

struct NextButton : View
{
    @Binding var increaseValue : Int
    
    var body : some View
    {
        VStack {
            Button {
                increaseValue += 1
            } label: {
                Text("Next")
            }
            .foregroundColor(.white)
            .bold()
        }
    }
}
