//
//  TutorialFlip.swift
//  asm2-ios
//
//  Created by An Vu Gia on 25/08/2023.
//

import SwiftUI

struct TutorialFlip: View {
    var body: some View {
        ZStack {
            Text("1. Basic")
                .font(.largeTitle)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-200, alignment: .top)
            VStack{
                Text("Wellcome to PokeFlipper, this guide will help you become a master in flipping pokemon in no time! ")
                HStack {
                    Text("This is the card you need to flip")
                    Image("card-back")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                    .frame(width: 100)
                }.padding()
                HStack {
                    Text("Match two card with the same pokemon to score!")
                    PokeCardView(pokeCard: pokemonData[0])
                    PokeCardView(pokeCard: pokemonData[0])
                    
                }.padding()
                Text("So Easy!")
            }
               
        }
    }
}

struct TutorialFlip_Previews: PreviewProvider {
    static var previews: some View {
        TutorialFlip()
    }
}
