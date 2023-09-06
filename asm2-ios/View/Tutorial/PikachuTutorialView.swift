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
