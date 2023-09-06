/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Vu Gia An
  ID: s3926888
  Created  date: 25/08/2023
  Last modified: 6/09/2023
  Acknowledgement: Acknowledge the resources that you use here.
*/

import SwiftUI
extension Color {
    init(hex: UInt, alpha: Double = 1.0) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}
struct PokeCardView: View {
    var pokeCard : PokeCard
    @State private var isShining = false
    var body: some View {
        let colorSets = pokeCard.getColorSets()
        ZStack {
            
            ZStack{
                
                Image(pokeCard.imgName)
                    .resizable()
                    .aspectRatio(contentMode: .fit )
                    .frame(width: 60)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .padding()
                
            }
            .frame(width: 60, height: 90)
            .background(AngularGradient(colors: [colorSets[0], colorSets[1], colorSets[2], colorSets[1], colorSets[0]], center: .center, startAngle: .degrees(90), endAngle: .degrees(360)))
            .padding([.leading, .trailing, .top, .bottom], 2)
            .background(Color.black)
            VStack {
                HStack{
                    Spacer()
                    ZStack {
                        ShiningView(isShining: $isShining, shineColor: .white, size: 30, shadowSize: 20)
                        ShiningView(isShining: $isShining, shineColor: colorSets[3], size: 30, shadowSize: 15)
                        Image(pokeCard.type)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30)
                            .background(.white)
                            .clipShape(Circle())
                    }
                    .padding([.top], 5)
                    .offset(x:10, y:-15)
                    .onAppear {
                        isShining = true
                    }
                                }
                Spacer()
            }
            }.frame(width: 60, height: 90)
            .padding([.leading, .trailing], 5)


                }
}

struct PokeCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokeCardView(pokeCard: PokeCard(name: "charizard", type: "Fire", imgName: "charizard", id: "1"))
    }
}
