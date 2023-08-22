//
//  ComboBar.swift
//  asm2-ios
//
//  Created by An Vu Gia on 22/08/2023.
//

import SwiftUI

struct ComboBar: View {
    @State private var currentCombo : [String] = ["Fire", "Water"]
    @State private var isResonent : Bool = false
    @State private var isChaos : Bool =  false
    @State private var isShining: Bool = false
    private let colors: [String:Color] = [
        "Fire": Color.red,
        "Water": Color.blue,
        "Grass": Color.green,
        "Chaos": Color.purple,
        "Resonent": Color.yellow
    ]
    var body: some View {
        ZStack {
                Image("combo-bar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150
                    )
            HStack {
                ForEach(currentCombo, id: \.self){ item in
                    ZStack {
                        if let shine = colors[item] {
                            ShiningView(isShining: $isShining, shineColor: shine , size: 30, shadowSize: 15)
                        }
                        Image(item)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        .frame(width: 30)
                    }
                }.padding([.leading], 5)
               
            }.frame(width: 130 , alignment: .leading)
        }.onAppear{
            isShining = true
        }
        
    }
}

struct ComboBar_Previews: PreviewProvider {
    static var previews: some View {
        ComboBar()
    }
}
