//
//  ComboBar.swift
//  asm2-ios
//
//  Created by An Vu Gia on 22/08/2023.
//

import SwiftUI

struct ComboBar: View {
        @ObservedObject private var comboBarModel = CombobarModel()
        @State private var isShining: Bool = false

        var body: some View {
            VStack {
                ZStack {
                    Image("combo-bar")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150
                        )
                HStack {
                    ForEach(comboBarModel.currentCombo, id: \.self){ item in
                        ZStack {
                            if let shine = comboBarModel.colors[item] {
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
                Button("Click") {
                    print("Click")
                    comboBarModel.addCombo(element: "Fire")
                }
            }
           
    }
}

struct ComboBar_Previews: PreviewProvider {
    static var previews: some View {
        ComboBar()
    }
}
