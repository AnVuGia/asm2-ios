//
//  TimerTutorial.swift
//  asm2-ios
//
//  Created by An Vu Gia on 25/08/2023.
//

import SwiftUI

struct TimerTutorial: View {
    var body: some View {
        ZStack {
            Text("3. Timer & Difficulty")
                .font(.largeTitle)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-200, alignment: .top)
            Grid {
                GridRow{
                    Text("Easy Mode: you get 30s for each flip")
                    Text("Total Score multiplier: x1")
                }.padding()
                GridRow{
                    Text("Normal Mode: you get 20s for each flip")
                    Text("Total Score multiplier: x2")
                }.padding()
                GridRow{
                    Text("Hard Mode: you get 10 for each flip, each round decrease the timer count by 2s")
                    Text("Total Score multiplier: x4")

                }.padding()
            }
    
               
        }

    }
}

struct TimerTutorial_Previews: PreviewProvider {
    static var previews: some View {
        TimerTutorial()
    }
}
