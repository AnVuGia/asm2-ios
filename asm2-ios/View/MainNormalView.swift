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
                if(table.isDone){
                    Button("Play again"){
                        gameSystem.playAgain()
                    }
                    
                } else {
                    Text("Is playing")
                }
                
                TableView(tableModel: gameSystem.table)
                ComboBar(comboBarModel: gameSystem.comboBarModel)
                    .padding(.top, 5)
                PointBoard(pointModel: gameSystem.pointBoardModel)
            }.padding()
                .background(Color.red)
        }
    }
}

struct MainNormalView_Previews: PreviewProvider {
    static var previews: some View {
        MainNormalView()
    }
}
