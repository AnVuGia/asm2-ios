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
    var body: some View {
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

struct MultiplierView_Previews: PreviewProvider {
    static var previews: some View {
        MultiplierView()
    }
}
