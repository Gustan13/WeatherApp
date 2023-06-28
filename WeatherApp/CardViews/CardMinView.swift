//
//  CardMinView.swift
//  WeatherApp
//
//  Created by Murilo Correa Pasquim on 23/06/23.
//

import SwiftUI

struct CardMinView: View {
    
    @Binding var weatherModel : WeatherModel
    var period : String
    
    var body: some View {
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading, spacing: 8) {
                
                Text(period)
                    .font(.body)
                    .foregroundColor(.white)
                
                Text(make_quote(weatherModel))
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                
                HStack() {
                    
                    VStack(alignment: .leading, spacing: -3) {
                        
                        Text("Sensação térmica")
                            .font(.footnote)
                            .foregroundColor(.white)
                        
                        Text("\(weatherModel.temperature.formatted())")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "\(weatherModel.symbolName)")
                        .font(.title)
                        .fontWeight(.bold)
                      .multilineTextAlignment(.center)
                      .foregroundColor(.white)
                      .frame(width: 50, height: 50, alignment: .center)
                }
            }
            
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(.white.opacity(0.1))
        .cornerRadius(8)
        .overlay(
        RoundedRectangle(cornerRadius: 8)
            .stroke(.white.opacity(0.5), lineWidth: 2)
            .cornerRadius(8))
    }
}

//struct CardMinView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardMinView(weatherModel: .constant(WeatherModel("7ºC", "sun", "Sem chuva", "muito vento")))
//    }
//}
