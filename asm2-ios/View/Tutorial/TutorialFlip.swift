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

struct TutorialFlip: View {
    let lang = UserDefaults.standard.string(forKey: "lang")
    var body: some View {
        ZStack {
            if lang == "ENG" {
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
            } else {
                Text("1. Cơ bản")
                    .font(.largeTitle)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-200, alignment: .top)
                VStack{
                    Text("Chào mừng tới PokeFlipper, hướng dẫn này sẽ giúp bạn thành thạo trò chơi này trong tíc tắc")
                    HStack {
                        Text("Đây là thẻ mà bạn cần phải lật")
                        Image("card-back")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100)
                    }.padding()
                    HStack {
                        Text("Lật 2 pokemon giống nhau để ghi điểm!")
                        PokeCardView(pokeCard: pokemonData[0])
                        PokeCardView(pokeCard: pokemonData[0])
                        
                    }.padding()
                    Text("Quá dễ!")
                }

            }
               
        }
    }
}

struct TutorialFlip_Previews: PreviewProvider {
    static var previews: some View {
        TutorialFlip()
    }
}
