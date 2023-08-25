//
//  MultiplierView.swift
//  asm2-ios
//
//  Created by An Vu Gia on 25/08/2023.
//

import SwiftUI

struct MultiplierView: View {
    var body: some View {
        ZStack {
            Text("3. Score Multiplier")
                .font(.largeTitle)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-200, alignment: .top)
            Grid{
                GridRow{
                    Text("Base point: ")
                   Text(" 200 (+200 each round)")
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
