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

struct TimerTutorial_Previews: PreviewProvider {
    static var previews: some View {
        TimerTutorial()
    }
}
