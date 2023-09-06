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
        }
    }
}

struct PointBoard_Previews: PreviewProvider {
    static var previews: some View {
        PointBoard(pointModel: PointCalculatorModel(difficultyMulti: 1))
    }
}
