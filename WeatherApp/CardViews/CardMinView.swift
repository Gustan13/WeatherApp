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
                    .foregroundColor(.black)
                
                Text(make_quote(weatherModel))
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
                
                HStack() {
                    
                    VStack(alignment: .leading, spacing: -3) {
                        
                        Text("Sensação térmica")
                            .font(.footnote)
                            .foregroundColor(Color(uiColor: .systemGray))
                        
                        Text("\(weatherModel.temperature.formatted())")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    Image(systemName: "\(weatherModel.symbolName)")
                        .font(.title)
                        .fontWeight(.bold)
                      .multilineTextAlignment(.center)
                      .foregroundColor(.black)
                      .frame(width: 50, height: 50, alignment: .center)
                }
            }
            
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(.white)
        .cornerRadius(8)
    }
}

//struct CardMinView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardMinView(weatherModel: .constant(WeatherModel("7ºC", "sun", "Sem chuva", "muito vento")))
//    }
//}
