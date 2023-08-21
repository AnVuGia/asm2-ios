//
//  PokeCardView.swift
//  asm2-ios
//
//  Created by An Vu Gia on 21/08/2023.
//

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
        var colorSets = pokeCard.getColorSets()
        ZStack{
            Image(pokeCard.imgName)
                .resizable()
                .aspectRatio(contentMode: .fill )
                .frame(width: 220, height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
            VStack {
                HStack{
                    Spacer()
                    ZStack {
                        ShiningView(isShining: $isShining, shineColor: .white, size: 40, shadowSize: 20)
                        ShiningView(isShining: $isShining, shineColor: colorSets[0], size: 35, shadowSize: 15)
                        Image(pokeCard.type)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50)
                            
                     
                    }
                    .padding(.trailing , 10)
                    .onAppear {
                        isShining = true
                    }
                                }
                Spacer()
            }
            Spacer()
        }
        .frame(width: 250, height: 350)
        .background(LinearGradient(colors: [colorSets[0], colorSets[1], colorSets[2]], startPoint: .top , endPoint: .center))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding([.leading, .trailing, .top, .bottom], 2)
        .background(Color.black)
        .clipShape(RoundedRectangle(cornerRadius: 20))

                }
}

struct PokeCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokeCardView(pokeCard: PokeCard(name: "charizard", type: "Fire", imgName: "charizard", id: "1"))
    }
}
