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

struct ComboTutorial: View {
    let lang = UserDefaults.standard.string(forKey: "lang")
    var body: some View {
        if lang == "ENG" {
            Tut1_EngView()
        } else {
            Tut1_VieView()
        }
    }
}
struct Tut1_EngView : View {
    var body: some View{
        ZStack {
            Text("2. Combo!")
                .font(.largeTitle)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-200, alignment: .top)
            VStack{
                Text("Since it's boring to just flip pokemon, why don't we spice things up by using combo?")
                    .frame(width: UIScreen.main.bounds.width-30)
                HStack {
                    Text("This is the combo bar!")
                   Image("combo-bar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                }.padding()
                HStack {
                    Text("Each time you score, you will get a matching element!")
                    Image("1xcombo")
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(width: 150)
                }.padding()

                HStack {
                    Text("You can get 3 of the same kind to get a special multiplier!")
                    Image("3xcombo")
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(width: 150)
                }.padding()
                Text("But there is more!")
            }
               
        }

    }
}
struct Tut1_VieView : View {
    var body: some View{
        ZStack {
            Text("2. Combo!")
                .font(.largeTitle)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-200, alignment: .top)
            VStack{
                Text("Bởi vì sẽ rất chán nếu chúng ta chỉ đơn giản lật bài như bình thường, vậy sao chúng ta không làm trò chơi này thú vị hơn nhỉ?")
                    .frame(width: UIScreen.main.bounds.width-30)
                HStack {
                    Text("Đây là thanh combo của bạn!")
                   Image("combo-bar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                }.padding()
                HStack {
                    Text("Mỗi lần bạn ghi điểm, bạn sẽ sở hữu một ngọc Nguyên Tố tương ướng")
                    Image("1xcombo")
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(width: 150)
                }.padding()

                HStack {
                    Text("Bạn có thể tích 3 ngọc để ghi điểm nhiều hơn!")
                    Image("3xcombo")
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(width: 150)
                }.padding()
                Text("Vẫn chưa hết!")
            }
               
        }

    }

}
struct ComboTutorial_Previews: PreviewProvider {
    static var previews: some View {
        ComboTutorial()
    }
}
