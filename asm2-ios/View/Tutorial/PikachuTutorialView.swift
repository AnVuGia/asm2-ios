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
    let lang = UserDefaults.standard.string(forKey: "lang")
    var body: some View {
        if lang == "ENG" {
            Tut3_EngView()
        } else {
            Tut3_VieView()
        }
    }
}
struct Tut3_EngView : View {
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

struct Tut3_VieView : View {
    var body: some View {
        ZStack {
            Text("3. Huyền thoại!")
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
                Text("Không cần phải giới thiệu nhiều, tất cả mọi người đều biết tới Pikachu. Như trong phim, Pokemon này rất đặc biệt! Khi bạn ghi điểm với Pikachu, bạn sẽ lập tức có ngay 1 ngọc Hoà Hợp, nếu như bạn đã có ngọc Hoà Hợp, bạn sẽ có 1 ngọc Hỗn Loạn. ")
                    .padding()
                Text("CẢNH BÁO: Nếu như bạn đã có đủ 2 loại ngọc, lật pikachu sẽ KHÔNG tính là được combo đủ 2 ngọc. Khi đó pikachu sẽ không gây ra bất kì hiệu ứng gì. ")
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
