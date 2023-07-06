import SwiftUI

struct MiniCardInstruction: View {
        
        @Binding var tabSelected: Int
        
        
        var body: some View {
            ZStack(){
                
                VStack(){
                    
                    HStack() {
                        Text("Hoje, 14 de dez.")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                       
                        Spacer()
                        
                        HStack {
                            Image(systemName: "location.fill")
                                .frame(width: 24, height: 24)
                            Text("Curitiba, PR")
                            
                        }.foregroundColor(.white)
                    }
                    
                    
                    VStack(alignment: .leading){
                    HStack {
                        Text("Manhã")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Text("11:00 AM")
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color(red: 0.46, green: 0.46, blue: 0.5).opacity(0.12))
                            .cornerRadius(8)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                        
                    
                    }
                    
                    Spacer()
                    
                    Text("Frase de previsão do tempo")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("laranjaTempo"))
                    
                    Spacer()
                    
                    HStack() {
                        
                        
                        VStack(alignment: .leading, spacing: -3) {
                            
                            Text("Sensação térmica")
                                .font(.callout)
                                .foregroundColor(Color(uiColor: .systemGray))
                            
                            Text("18°C")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "cloud")
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
                                .foregroundColor(Color("laranjaTempo"))
                            
                            
                            VStack(alignment: .leading){
                                
                                Text("Chuva")
                                    .font(.caption2)
                                
                                    .foregroundColor(Color(uiColor: .secondaryLabel))
                                
                                Text("Sem chuva")
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
                                    .foregroundColor(Color("laranjaTempo"))
                                
                                
                                VStack(alignment: .leading){
                                    
                                    Text("Vento")
                                        .font(.caption2)
                                        .foregroundColor(Color(uiColor: .secondaryLabel))
                                    
                                    Text("Sem vento")
                                        .font(.footnote)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                }
                            }
                            .frame(width: 130)
                        }
                    }
                }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .background(.white)
                    .cornerRadius(8)
                    .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.white.opacity(0.5), lineWidth: 0)
                    .shadow(color: .black.opacity(0.1), radius: 4, y: 8)
                    )
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Tarde")
                            .font(.body)
                            .foregroundColor(.white)
                        
                        Text("Frase de previsão do tempo")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        HStack() {
                            
                            VStack(alignment: .leading, spacing: 0) {
                                
                                Text("Sensação térmica")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                
                                Text("18°C")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            
                            Image(systemName: "cloud")
                                .font(.title)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .frame(width: 50, height: 50, alignment: .center)
                        }
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .background(.white.opacity(0.1))
                    .cornerRadius(8)
                    .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.white.opacity(0.5), lineWidth: 2)
                    .shadow(color: .black.opacity(0.1), radius: 0, y: 0)
                    )
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Noite")
                            .font(.body)
                            .foregroundColor(.white)
                        
                        Text("Frase de previsão do tempo")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        HStack() {
                            
                            VStack(alignment: .leading, spacing: 0) {
                                
                                Text("Sensação térmica")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                
                                Text("18°C")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            
                            Image(systemName: "cloud")
                                .font(.title)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .frame(width: 50, height: 50, alignment: .center)
                        }
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .background(.white.opacity(0.1))
                    .cornerRadius(8)
                    .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.white.opacity(0.5), lineWidth: 2)
                    .shadow(color: .black.opacity(0.1), radius: 0, y: 0)
                    )
                }
                .padding(16)
                .background(.radialGradient(Gradient(colors: dia), center: .topLeading, startRadius: 0, endRadius: 1000))
                .blur(radius: 7)
                .preferredColorScheme(ColorScheme.light)
                
                VStack(alignment: .center, spacing: 16){
                    Spacer()
                    
                    VStack(spacing: 8){
                        Text("Outros períodos do dia")
                            .font(.title2)
                            .bold()
                            
                        
                        Text("Clique nos outros períodos do dia para saber mais informações")
                          .multilineTextAlignment(.center)
                          .frame(width: 340, height: 44, alignment: .top)
                          .padding(8)
                    }
//                    .padding(64)
                    
                    
                    HStack(){
                        Image(systemName: "circle.fill")
                            .foregroundColor(Color.white.opacity(0.5))
                        Image(systemName: "circle.fill")
                            .foregroundColor(Color.white.opacity(0.5))
                        Image(systemName: "circle.fill")
                            .foregroundColor(Color.white.opacity(0.5))
                        Image(systemName: "circle.fill")
                            .foregroundColor(.white)
                    }
                    .font(.system(size: 8))
                    
                    HStack {
                        Spacer()
                        NextButton(increaseValue: $tabSelected)
                    }
                    .padding(.horizontal)
                }
                .foregroundColor(.white)
                .frame(maxWidth:.infinity)
                .background(Color.black.opacity(0.5))
                
                VStack(){
                    
                    HStack() {
                        Text("Hoje, 14 de dez.")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white.opacity(0))
                       
                        Spacer()
                        
                        HStack {
                            Image(systemName: "location.fill")
                                .frame(width: 24, height: 24)
                            Text("Curitiba, PR")
                            
                        }
                    }.foregroundColor(Color.white.opacity(0))
                    
                    
                    VStack(alignment: .leading){
                    HStack {
                        Text("Manhã")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                        
                        Spacer()
                        
                        Text("11:00 AM")
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(Color(red: 0.46, green: 0.46, blue: 0.5).opacity(0.12))
                            .cornerRadius(8)
                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                    
                    }
                    
                    Spacer()
                    
                    Text("Frase de previsão do tempo")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(Color("laranjaTempo"))
                    
                    Spacer()
                    
                    HStack() {
                        
                        
                        VStack(alignment: .leading, spacing: -3) {
                            
                            Text("Sensação térmica")
                                .font(.callout)
                                .foregroundColor(Color(uiColor: .systemGray))
                            
                            Text("18°C")
                                .font(.largeTitle)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "cloud")
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
                                .foregroundColor(Color("laranjaTempo"))
                            
                            
                            VStack(alignment: .leading){
                                
                                Text("Chuva")
                                    .font(.caption2)
                                
                                    .foregroundColor(Color(uiColor: .secondaryLabel))
                                
                                Text("Sem chuva")
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
                                    .foregroundColor(Color("laranjaTempo"))
                                
                                
                                VStack(alignment: .leading){
                                    
                                    Text("Vento")
                                        .font(.caption2)
                                        .foregroundColor(Color(uiColor: .secondaryLabel))
                                    
                                    Text("Sem vento")
                                        .font(.footnote)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                }
                            }
                            .frame(width: 130)
                        }
                    }
                }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .background(.white)
                    .cornerRadius(8)
                    .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.white.opacity(0.5), lineWidth: 0)
                    .shadow(color: .black.opacity(0.1), radius: 4, y: 8)
                    )
                    .opacity(0)
                    
                   Spacer()
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Tarde")
                            .font(.body)
                            .foregroundColor(.white)
                        
                        Text("Gelado")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        HStack() {
                            
                            VStack(alignment: .leading, spacing: 0) {
                                
                                Text("Sensação térmica")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                
                                Text("2°C")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            
                            Image(systemName: "cloud")
                                .font(.title)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .frame(width: 50, height: 50, alignment: .center)
                        }
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .background(.white.opacity(0.1))
                    .cornerRadius(8)
                    .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.white.opacity(0.5), lineWidth: 2)
                    .shadow(color: .black.opacity(0.1), radius: 0, y: 0)
                    )
                    
                    
                    VStack(alignment: .leading, spacing: 8) {
                        
                        Text("Noite")
                            .font(.body)
                            .foregroundColor(.white)
                        
                        Text("Frase de previsão do tempo")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        HStack() {
                            
                            VStack(alignment: .leading, spacing: 0) {
                                
                                Text("Sensação térmica")
                                    .font(.footnote)
                                    .foregroundColor(.white)
                                
                                Text("18°C")
                                    .font(.title2)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                            }
                            Spacer()
                            
                            Image(systemName: "cloud")
                                .font(.title)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.white)
                                .frame(width: 50, height: 50, alignment: .center)
                        }
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .topLeading)
                    .background(.white.opacity(0.1))
                    .cornerRadius(8)
                    .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.white.opacity(0.5), lineWidth: 2)
                    .shadow(color: .black.opacity(0.1), radius: 0, y: 0)
                    )
                    .opacity(0)
                    
                    
                }
                .padding(16)
            }
            
            
        }
        
        
    }

//struct LocationInstructionView_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationInstructionView()
//    }
//}
