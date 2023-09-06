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

struct ComboTutorial2: View {
    let lang = UserDefaults.standard.string(forKey: "lang")
    var body: some View {
        if lang == "ENG" {
            Tut2_EngView()
        } else  {
            Tut2_VieView()
        }
    }
}
struct Tut2_EngView : View {
    var body: some View {
        ZStack {
            Text("2.1 More Combo!")
                .font(.largeTitle)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-200, alignment: .top)
            VStack{
                HStack {
                    Text("If you get 3 different kind of element, you will get a Chaos orb!")
                   Image("chaoscombo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                }.padding()
                HStack {
                    Text("If you get 3 of the same kind of element, you will get a Resonance orb!")
                    Image("resonancecombo")
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(width: 150)
                }.padding()
                Text("If you get a combo that is not in the combo, you will get a Resonance orb, if you already have a Resonance orb, you will get a Chaos orb instead!")
                    .padding()
                HStack {
                    Text("If you get both orbs, the next combo you make will have a massive multiplier!")
                    Image("fullcombo")
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(width: 150)
                }.padding()
         
            }
               
        }
    }
}
struct Tut2_VieView : View {
    var body: some View {
        ZStack {
            Text("2.1 Thêm về Combo!")
                .font(.largeTitle)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-200, alignment: .top)
            VStack{
                HStack {
                    Text("Nếu bạn có 3 nguyên tố khác nhau, bạn sẽ tạo ra ngọc Hỗn Loạn")
                   Image("chaoscombo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                }.padding()
                HStack {
                    Text("Nếu bạn có 3 nguyên tố trùng nhau bạn sẽ tạo ra ngọc Hoà Hợp")
                    Image("resonancecombo")
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(width: 150)
                }.padding()
                Text("Nếu bạn tạo ra một combo không có ở trên, bạn sẽ tạo ra ngọc Hoà Hợp, nếu bạn đã có sẵn ngọc Hoà Hợp, bạn tạo ngọc Hỗn Loạn")
                    .padding()
                HStack {
                    Text("Nếu bạn đang sở hữu cả 2 loại ngọc, combo tiếp theo sẽ tạo nên một số điểm LỚN cho bạn")
                    Image("fullcombo")
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(width: 150)
                }.padding()
         
            }
               
        }

    }
}

struct ComboTutorial2_Previews: PreviewProvider {
    static var previews: some View {
        ComboTutorial2()
    }
}
