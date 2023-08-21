//
//  PokeCardView.swift
//  asm2-ios
//
//  Created by An Vu Gia on 21/08/2023.
//

import SwiftUI

struct PokeCardView: View {
    var pokeCard : PokeCard
    var body: some View {
        VStack{
            Image(pokeCard.imgName)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding()
            Text("Hello")
            Spacer()
        }
        .frame(width: 250, height: 350)
        .background(Color.orange)
        .clipShape(RoundedRectangle(cornerRadius: 20))
                }
}

struct PokeCardView_Previews: PreviewProvider {
    static var previews: some View {
        PokeCardView(pokeCard: PokeCard(name: "charizard", type: "Fire", imgName: "charizard", id: "1"))
    }
}
