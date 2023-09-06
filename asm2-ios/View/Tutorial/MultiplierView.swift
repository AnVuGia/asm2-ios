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

struct MultiplierView: View {
    let lang = UserDefaults.standard.string(forKey: "lang")
    var body: some View {
        if lang == "ENG" {
            Tut4_EngView()
        } else {
            Tut4_VieView()
        }
    }
}
struct Tut4_EngView : View {
    var body: some View{
        ZStack {
            Text("4. Score Multiplier")
                .font(.largeTitle)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-200, alignment: .top)
            Grid{
                GridRow{
                    Text("Base point: ")
                   Text("200")
                }.padding()
                GridRow{
                    Text("3 of a kind: ")
                    Text("x3")
                }.padding()
                GridRow{
                    Text("3 different elements: ")
                    Text("x3")
                }.padding()
                GridRow{
                    Text("2 of a kind and 1 other: ")
                    Text("x2")
                }.padding()
                GridRow{
                    Text("Combo when have both Chaos and Resonance orb: ")
                    Text("x5")
                }.padding()


            }
          
               
        }
    }
}
struct Tut4_VieView: View {
    var body: some View {
        ZStack {
            Text("4. Hệ số điểm")
                .font(.largeTitle)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-200, alignment: .top)
            Grid{
                GridRow{
                    Text("Điểm cơ bản: ")
                   Text("200")
                }.padding()
                GridRow{
                    Text("3 nguyên tố giống nhau: ")
                    Text("x3")
                }.padding()
                GridRow{
                    Text("3 nguyên tố khác nhau: ")
                    Text("x3")
                }.padding()
                GridRow{
                    Text("2 nguyên tố giống và 1 khác: ")
                    Text("x2")
                }.padding()
                GridRow{
                    Text("Combo khi có cả ngọc Hỗn Loạn và ngọc Hoà Hợp: ")
                    Text("x5")
                }.padding()


            }
          
               
        }

    }
}
struct MultiplierView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplierView()
    }
}
