//
//  ComboTutorial2.swift
//  asm2-ios
//
//  Created by An Vu Gia on 25/08/2023.
//

import SwiftUI

struct ComboTutorial2: View {
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
                    Text("You can get 3 of the same kind to get a special multiplier!")
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
