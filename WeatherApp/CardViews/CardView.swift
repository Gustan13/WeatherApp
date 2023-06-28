import SwiftUI

func color_picker(_ period: String) -> Color
{
    switch period
    {
    case "Manhã":
        return Color("laranjaTempo")
    
    case "Tarde":
        return Color("rosaTempo")
    
    case "Noite":
        return Color("azulTempo")
        
    default:
        return Color(.white)
    }
}

struct CardView: View {
    
    @Binding var weatherModel : WeatherModel
    var period : String
    var active: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            
            if active {
                Group {
                    Text(period)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(color_picker(period))
                    
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
                                .foregroundColor(color_picker(period))
                        }
                        
                        Spacer()
                        
                        Image(systemName: "\(weatherModel.symbolName)")
                            .font(
                                Font.custom("SF Pro", size: 48)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(color_picker(period))
                            .frame(width: 64, height: 64, alignment: .center)
                        
                    }
                    
                    Divider()
                    
                    HStack(){
                        
                        HStack() {
                            Image(systemName: "drop")
                                .frame(width: 28, height: 28)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(color_picker(period))
                            
                            
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
                                    .foregroundColor(color_picker(period))
                                
                                
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
            } else {
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
                                .foregroundColor(Color(uiColor: .systemGray))
                            
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
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(active == false ? (.white.opacity(0.1)) : (.white))
        .cornerRadius(8)
//        .overlay(
//        RoundedRectangle(cornerRadius: 8)
//            .stroke(.white.opacity(0.5), lineWidth: 3)
//            .cornerRadius(8))
    }
}