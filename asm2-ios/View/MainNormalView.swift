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
    @ObservedObject var timerModel = TimerModel(timerCount: 100)
    @State var currentRound = 1
    init() {
        self.table = gameSystem.table
        gameSystem.attachTimerModel(timerModel: timerModel)
        
    }
    var body: some View {
        ZStack {
            
            Image("background7x7")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text("Round \(currentRound)")
                    Spacer()
                    CountdownTimerView(timerModel: gameSystem.timerModel)
                        .onReceive(gameSystem.timerModel.timer) { _ in
                            if gameSystem.timerModel.timerIsRunning && gameSystem.timerModel.remainingTime > 0 {
                                gameSystem.timerModel.remainingTime -= 1
                                if(gameSystem.timerModel.remainingTime == 0) {
                                    gameSystem.timerModel.isOver = true
                                }
                            }
                        }
                }.frame(width: UIScreen.main.bounds.width-50)
                    TableView(tableModel: gameSystem.table)
                    ComboBar(comboBarModel: gameSystem.comboBarModel)
                        .padding(.top, 5)
                    PointBoard(pointModel: gameSystem.pointBoardModel)
                }.padding()
                if(table.isDone){
                    if(currentRound <= 3){
                        Button("Next Round") {
                            gameSystem.playAgain()
                            currentRound+=1
                            table.isDone = false
                        }.background(Color.white)
                    }
                    else {
                        PlayAgainView(score: gameSystem.pointBoardModel.currentPoints)
                    }
                }
                if (gameSystem.timerModel.isOver){
                    PlayAgainView(score: gameSystem.pointBoardModel.currentPoints)
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
