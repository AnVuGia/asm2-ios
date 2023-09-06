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

struct ComboBar: View {
        @ObservedObject  var comboBarModel : CombobarModel
        @State private var isShining: Bool = false
        
        var body: some View {
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
                    } else {
                        EmtyView().frame(width: 40, height: 40)
                        
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
                    } else {
                        EmtyView().frame(width: 40, height: 40)
                    }
                }
            }
           
    }
}

struct ComboBar_Previews: PreviewProvider {
    static var previews: some View {
        var pointBoard = PointCalculatorModel(difficultyMulti: 1)
        @State var comboBar = CombobarModel()
        ComboBar(comboBarModel: comboBar)
    }
}
