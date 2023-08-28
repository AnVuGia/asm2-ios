//
//  MainNormalView.swift
//  asm2-ios
//
//  Created by An Vu Gia on 21/08/2023.
//

import SwiftUI

struct MainNormalView: View {
    @ObservedObject var gameSystem = GameSystem(difficulty: 1)
    @ObservedObject var table = TableModel()
    @ObservedObject var timerModel = TimerModel(timerCount: 0)
    init(difficulty: Int) {

        self.table = gameSystem.table
        gameSystem.attachTimerModel(timerModel: timerModel)
        gameSystem.difficulty = difficulty
        if(difficulty == 1) {
            timerModel.timerCount = 100
        } else if difficulty == 2{
            timerModel.timerCount = 30
        } else if difficulty == 4 {
            timerModel.timerCount = 10
        }
    }
    var body: some View {
        ZStack {
            
            Image("background7x7")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Text("Round \(gameSystem.currentRound)")
                    Spacer()
                    CountdownTimerView(timerModel: gameSystem.timerModel)
                        .onReceive(gameSystem.timerModel.timer) { _ in
                            if gameSystem.timerModel.timerIsRunning && gameSystem.timerModel.remainingTime > 0 {
                                gameSystem.timerModel.remainingTime -= 1
                                if(gameSystem.timerModel.remainingTime == 0 && gameSystem.timerModel.timerIsRunning) {
                                    print("game over")
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
                    if(gameSystem.currentRound <= 5){
                        Button("Next Round") {
                            gameSystem.playAgain()
                            gameSystem.currentRound+=1
                            table.isDone = false
                            gameSystem.timerModel.remainingTime = gameSystem.timerModel.timerCount
                            gameSystem.timerModel.timerIsRunning = true
                        }.background(Color.white)
                            .onAppear{
                                gameSystem.timerModel.timerIsRunning = false
                            }
                    }
                    else {
                        PlayAgainView(score: gameSystem.pointBoardModel.currentPoints)
                    }
                }
//            if (gameSystem.timerModel.isOver && gameSystem.timerModel.timerIsRunning){
//                    PlayAgainView(score: gameSystem.pointBoardModel.currentPoints)
//                }
                
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            
        }
        
        
    }

struct MainNormalView_Previews: PreviewProvider {
    static var previews: some View {
        MainNormalView(difficulty: 4)
    }
}
