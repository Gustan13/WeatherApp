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
    
    @Namespace var namespace
    @Binding var weatherModel : WeatherModel
    var period : String
    var active: Bool
    var horario: Int
    
    @Binding var h : Int
    
    var hourKey : String {
        switch period
        {
        case "Manhã":
            return "dayHour"
        case "Tarde":
            return "eveningHour"
        case "Noite":
            return "nightHour"
        default:
            return "none"
        }
    }
    
    @State var date : Date
    
    var body: some View {
        
        let dateRange: ClosedRange<Date> = {
            let calendar = Calendar.current
            let year = calendar.component(.year, from: date)
            let month = calendar.component(.month, from: date)
            let day = calendar.component(.day, from: date)
            
            var startHour : Int {
                switch period
                {
                case "Manhã":
                    return 4
                case "Tarde":
                    return 12
                case "Noite":
                    return 18
                default:
                    return 0
                }
            }
            
            var endHour : Int {
                switch period
                {
                case "Manhã":
                    return 11
                case "Tarde":
                    return 17
                case "Noite":
                    return 23
                default:
                    return 0
                }
            }
            
            let startComponents = DateComponents(year: year, month: month, day: day, hour: startHour, minute: 0)
            let endComponents = DateComponents(year: year, month: month, day: day, hour: endHour, minute: 59)
            return calendar.date(from:startComponents)!
                ...
                calendar.date(from:endComponents)!
        }()
        
        VStack(alignment: .leading) {
            
            if active {
                Group {
                    HStack {
                        Text(period)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .frame(width: 100, height: 15, alignment: .leading)
                        
                        Spacer()
                        
                        DatePicker(
                            "",
                            selection: $date,
                            in: dateRange,
                            displayedComponents: [.hourAndMinute]
                        )
                        .onChange(of: date) { newValue in
                            let calendar = Calendar.current
                            h = calendar.component(.hour, from: newValue)
                            UserDefaults.standard.setValue(h, forKey: hourKey)
                        }
                        .datePickerStyle(.graphical)
                        .preferredColorScheme(.light)
                        .onTapGesture {
                            print("Oi")
                        }
                        .padding(.trailing, -12)
                    }
                    
                    Spacer()
                    
                    HStack {
                        Text(make_quote(weatherModel))
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(color_picker(period))
                            .frame(width: 300, height: 125, alignment: .leading)

                        Spacer()
                    }
                    
                    Spacer()
                    
                    HStack() {
                        Image(systemName: "\(weatherModel.symbolName)")
                            .font(
                                Font.custom("SF Pro", size: 40)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(.black)
                            .frame(width: 64, height: 64, alignment: .leading)
                        
                        Spacer()
                        
                        VStack(alignment: .center) {
                            
                            Text("Sensação")
                                .font(.footnote)
                                .foregroundColor(Color(uiColor: .systemGray))
                            
                            Text("\(weatherModel.temperature.formatted())")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                    }
                    
                    Divider()
                        .padding(.bottom, 8)
                    
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
                                    .foregroundColor(.black)
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
                                        .foregroundColor(.black)
                                }
                            }
                            .frame(width: 130)
                        }
                    }
                }
            } else {
                VStack(alignment: .leading, spacing: 8) {
                    
                    Text(period)
                        .font(.body)
                        .foregroundColor(.white)
                        .frame(width: 100, height: 15, alignment: .leading)
                    
                    HStack {
                        Text(make_quote(weatherModel))
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .multilineTextAlignment(.leading)
                        Spacer()
                    }
                    
                    HStack() {
                        
                        Image(systemName: "\(weatherModel.symbolName)")
                            .font(.title)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .foregroundColor(.white)
                            .frame(width: 50, height: 50, alignment: .leading)
                        
                        Spacer()
                        
                        VStack(alignment: .center) {
                            
                            Text("Sensação")
                                .font(.footnote)
                                .foregroundColor(.white)
                            
                            Text("\(weatherModel.temperature.formatted())")
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .topLeading)
        .background(active == false ? (.white.opacity(0.1)) : (.white))
        .cornerRadius(8)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.white.opacity(0.5), lineWidth: active == true ? (0) : (2))
        )
        .shadow(color: .black.opacity(0.1), radius: active == true ? (4) : (0), y: active == true ? (8) : (0))
        .onAppear {
            print("\(date), bro")
        }
    }
}
