//
//  ComboBar.swift
//  asm2-ios
//
//  Created by An Vu Gia on 22/08/2023.
//

import SwiftUI

struct ComboBar: View {
        @ObservedObject  var comboBarModel : CombobarModel
        @State private var isShining: Bool = false
        
        var body: some View {
            let test = ["Fire", "Water", "Grass"]
            VStack {
                HStack {
                    if(comboBarModel.isResonent){
                        ZStack {
                            ShiningView(isShining: $isShining, shineColor: Color.yellow, size: 30, shadowSize: 20)
                            Image("Resonant")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                        }
                    }
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
                    if(comboBarModel.isChaos){
                        ZStack {
                            ShiningView(isShining: $isShining, shineColor: Color.purple, size: 30, shadowSize: 20)
                            Image("Chaos")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 40)
                        }
                    }
                }
//                Button("Click") {
//                    let index = Int.random(in: 0..<3)
//                    comboBarModel.addCombo(element: test[index])
//                }
            }
           
    }
}

struct ComboBar_Previews: PreviewProvider {
    static var previews: some View {
        var pointBoard = PointCalculatorModel()
        @State var comboBar = CombobarModel()
        ComboBar(comboBarModel: comboBar)
    }
}
