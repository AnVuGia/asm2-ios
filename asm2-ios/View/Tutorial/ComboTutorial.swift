//
//  ComboTutorial.swift
//  asm2-ios
//
//  Created by An Vu Gia on 25/08/2023.
//

import SwiftUI

struct ComboTutorial: View {


    var body: some View {
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

struct ComboTutorial_Previews: PreviewProvider {
    static var previews: some View {
        ComboTutorial()
    }
}
