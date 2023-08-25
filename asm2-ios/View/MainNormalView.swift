//
//  MainNormalView.swift
//  asm2-ios
//
//  Created by An Vu Gia on 21/08/2023.
//

import SwiftUI

struct MainNormalView: View {
        @ObservedObject var gameSystem = GameSystem()
        @ObservedObject var table = TableModel()
        @State var currrentRound = 1
    init() {
        self.table = gameSystem.table
    }
        var body: some View {
        ZStack {
            
            Image("background7x7")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                TableView(tableModel: gameSystem.table)
                ComboBar(comboBarModel: gameSystem.comboBarModel)
                    .padding(.top, 5)
                PointBoard(pointModel: gameSystem.pointBoardModel)
            }.padding()
            if(table.isDone){
                if(currrentRound <= 3){
                    Button("Next Round") {
                        gameSystem.playAgain()
                        currrentRound+=1
                        table.isDone = false
                    }.background(Color.white)
                } else {
                    PlayAgainView(score: gameSystem.pointBoardModel.currentPoints)
                }
                
            }
            
        }
        .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)

    }
       

}

struct MainNormalView_Previews: PreviewProvider {
    static var previews: some View {
        MainNormalView()
    }
}
