//
//  CardExpView.swift
//  WeatherApp
//
//  Created by Murilo Correa Pasquim on 23/06/23.
//

import SwiftUI

struct CardMaxView: View {
    
    @Binding var weatherModel : WeatherModel
    var period : String
    
    var body: some View {
        VStack(alignment: .leading) {
            
                Text(period)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.black)
                
                Text("A partir das 7h")
                .font(.footnote)
                  .foregroundColor(Color(uiColor: .systemGray))
            Spacer()

                Text(make_quote(weatherModel))
                .font(.largeTitle)
                .fontWeight(.bold)
                  .foregroundColor(.black)
            
            Spacer()
            
            HStack() {
                
        
                VStack(alignment: .leading, spacing: -3) {
                    
                    Text("Sensação térmica")
                        .font(.callout)
                        .foregroundColor(Color(uiColor: .systemGray))
                
                    Text("\(weatherModel.temperature.formatted())")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                
                Spacer()
            
                Image(systemName: "\(weatherModel.symbolName)")
                  .font(
                    Font.custom("SF Pro", size: 48)
                      .weight(.bold)
                  )
                  .multilineTextAlignment(.center)
                  .foregroundColor(.black)
                  .frame(width: 64, height: 64, alignment: .center)
                
            }
            
            Divider()
            
            HStack(){
                
                HStack() {
                    Image(systemName: "drop")
                        .frame(width: 28, height: 28)
                        .font(.title2)
                        .fontWeight(.bold)
                
                    
                    VStack(alignment: .leading){
                    
                    Text("Chuva")
                        .font(.caption2)
                        
                        .foregroundColor(Color(uiColor: .secondaryLabel))
                    
                        Text(get_rainphrase(rain: weatherModel.precipitation.value))
                        .font(.footnote)
                        .fontWeight(.bold)
                }
                    
                    Spacer()
                    
                    HStack() {
                        Image(systemName: "wind")
                            .frame(width: 28, height: 28)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        
                        VStack(alignment: .leading){
                            
                            Text("Vento")
                                .font(.caption2)
                            
                                .foregroundColor(Color(uiColor: .secondaryLabel))
                            
                            Text(get_windphrase(wind: weatherModel.wind.value))
                                .font(.footnote)
                                .fontWeight(.bold)
                        }
                    }
                    
                }
                
            }
            
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(.white)
        .cornerRadius(8)

        // funfa

    }
}

//struct CardMaxView_Previews: PreviewProvider {
//
////    @State var coiso = WeatherModel("7ºC", "sun", "Sem chuva", "muito vento")
//
//    static var previews: some View {
//        CardMaxView(weatherModel: .constant(WeatherModel("7ºC", "sun", "Sem chuva", "muito vento")))
//    }
//}
