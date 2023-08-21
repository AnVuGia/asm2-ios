//
//  CardBack.swift
//  asm2-ios
//
//  Created by An Vu Gia on 21/08/2023.
//

import SwiftUI

struct CardBack: View {
    var pokeCard : PokeCard
    @Binding var isClick : Bool
    var body: some View {
        if (isClick){
            PokeCardView(pokeCard: pokeCard)
        }
        else{
            Image("card-back")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70)
                }
    }
}

struct CardBack_Previews: PreviewProvider {
    static var previews: some View {
        CardBack(pokeCard: PokeCard(name: "charizard", type: "Fire", imgName: "charizard", id: "1"), isClick: .constant(true))
    }
}
