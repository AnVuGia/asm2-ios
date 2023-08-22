//
//  PointBoard.swift
//  asm2-ios
//
//  Created by An Vu Gia on 22/08/2023.
//

import SwiftUI


struct PointBoard: View {
    @ObservedObject  var pointModel : PointCalculatorModel
    var body: some View {
        VStack {
            ZStack {
                Image("point-bar")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Text("\(pointModel.currentPoints)")
                    .foregroundColor(Color.white)
            }.frame(width: 130)
           Button("click"){
               pointModel.addPoints(points: 200, multiplier: 3)

          }
        }
    }
}

struct PointBoard_Previews: PreviewProvider {
    static var previews: some View {
        PointBoard(pointModel: PointCalculatorModel())
    }
}
