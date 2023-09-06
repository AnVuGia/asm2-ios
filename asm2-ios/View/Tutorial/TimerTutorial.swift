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

struct TimerTutorial: View {
    let lang = UserDefaults.standard.string(forKey: "lang")

    var body: some View {
        if lang == "ENG" {
            Tut5_EngView()
        } else {
            Tut5_VieView()
        }

    }
}
struct Tut5_EngView : View {
    var body: some View {
        ZStack {
            Text("5. Timer & Difficulty")
                .font(.largeTitle)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-200, alignment: .top)
            VStack {
                Grid {
                    GridRow{
                        Text("Easy Mode: you get 40s for each flip")
                        Text("Score multiplier: x1")
                    }.padding()
                    GridRow{
                        Text("Normal Mode: you get 30s for each flip")
                        Text("Score multiplier: x2")
                    }.padding()
                    GridRow{
                        Text("Hard Mode: you get 15 for each flip")
                        Text("Score multiplier: x4")

                    }.padding()
                }
                Text("Each round reduce the timer by 2s")
            }
            
    
        }
    }
}

struct Tut5_VieView: View {
    var body: some View {
        ZStack {
            Text("5. Thời gian & Độ khó")
                .font(.largeTitle)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-200, alignment: .top)
            VStack {
                Grid {
                    GridRow{
                        Text("Dễ : bạn có 40 giây cho 1 lần lật")
                        Text("Hệ số điểm: x1")
                    }.padding()
                    GridRow{
                        Text("Thường: bạn có 30 giây cho 1 lần lật")
                        Text("Hệ số điểm: x2")
                    }.padding()
                    GridRow{
                        Text("Khó: bạn có 15 giây cho 1 lần lật")
                        Text("Hệ số điểm: x4")

                    }.padding()
                }
                Text("Mỗi vòng giảm thời gian cơ bản đi 2 giây")
            }
            
    
        }
    }
}
struct TimerTutorial_Previews: PreviewProvider {
    static var previews: some View {
        TimerTutorial()
    }
}
