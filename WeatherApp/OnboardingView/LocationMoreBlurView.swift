import SwiftUI

struct LocationMoreBlurView: View {
    
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
            .blur(radius: 12)
            .preferredColorScheme(ColorScheme.light)
            
            VStack(alignment: .center, spacing: 8) {
                
                Spacer()
                
                Image(systemName: "mappin.and.ellipse")
                    .font(.system(size: 48)) //Para alterar o tamanho de um Símbolo do SF Symbols
                    .frame(width: 64, height: 64)
                    .foregroundColor(.gray)
                    .padding(.top, 64)

                Text("Localização")
                    .font(.title2)
                    .bold() //Para deixar uma fonte do sistema em Bold
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.bottom, 8)
                
                Text("Precisamos da sua localização para \n oferecer uma melhor previsão.")
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                
                
                ZStack(alignment: .center) {
                    
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray)
                        .frame(width: 306, height: 56, alignment: .center)
                        .background(.black.opacity(0.1))
                        .cornerRadius(8)
                        .padding(16)
                    
                    Text("\(Image(systemName: "lock")) Seus dados são seus. \n Não utilizaremos para mais nada.")
                        .font(.footnote)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding(16)
                    


                }
                
                Text("Entendi")
                    .bold()
                    .foregroundColor(.white)
                    .onTapGesture {
//                        lm.requestLocationAlways()
                        tabSelected = 2
                    }
                
                Spacer()
                    .frame(height: 24)


            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.black.opacity(0.8))
        }
    }
}

//struct LocationBlurView_Previews: PreviewProvider {
//    static var previews: some View {
//        LocationBlurView()
//    }
//}
