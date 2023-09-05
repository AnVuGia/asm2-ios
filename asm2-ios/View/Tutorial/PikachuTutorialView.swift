//
//  PikachuTutorialView.swift
//  asm2-ios
//
//  Created by An Vu Gia on 05/09/2023.
//

import SwiftUI

struct PikachuTutorialView: View {
    var body: some View {
        ZStack {
            Text("3. The legend!")
                .font(.largeTitle)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-200, alignment: .top)
            VStack{
                HStack {
                    PokeCardView(pokeCard: pokemonData[9])
                        .aspectRatio(contentMode: .fit)
                    PokeCardView(pokeCard: pokemonData[9])
                        .aspectRatio(contentMode: .fit)
                    PokeCardView(pokeCard: pokemonData[9])
                        .aspectRatio(contentMode: .fit)
                }.padding()
                Text("Needs no introduction, everybody knows Pikachu. Just like in the movie, this Pokemon is special! When Pikachu gets flipped, you will immediately get a Resonance orb, if you already got a Resonance orb, you will get a Chaos orb instead.")
                    .padding()
                Text("WARNING: if you already got both orb, pikachu WILL NOT trigger a full combo and will have no effect!")
                    .padding()
         
            }.padding()
               
        }
    }
}

struct PikachuTutorialView_Previews: PreviewProvider {
    static var previews: some View {
        PikachuTutorialView()
    }
}
