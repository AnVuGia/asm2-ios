//
//  MainNormalView.swift
//  asm2-ios
//
//  Created by An Vu Gia on 21/08/2023.
//

import SwiftUI

struct MainNormalView: View {
    @ObservedObject var gameSystem = GameSystem(difficulty: 1)

    @ObservedObject var timerModel = TimerModel(timerCount: 0)
    init(difficulty: Int, isContinue: Bool) {
        gameSystem.setDifficulty(difficulty: difficulty)
        gameSystem.attachTimerModel(timerModel: timerModel)
        
        
        if(difficulty == 1) {
            timerModel.timerCount = 40
        } else if difficulty == 2{
            timerModel.timerCount = 30
        } else if difficulty == 4 {
            timerModel.timerCount = 15
        }
        if(isContinue) {
            gameSystem.load()
    
        }
    }
    var body: some View {
        NavigationStack {
            ZStack {
                Image("background7x7")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack {
                    HStack{
                        Spacer()
                        NavigationLink {
                            WelcomeView()
                        } label: {
                            Image("home-button")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 30)
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                                .padding()
                        }
                    }.frame(width:UIScreen.main.bounds.width)
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
                }
                if(gameSystem.table.isDone){
                        if(gameSystem.currentRound < 5){
                                                                
                            Button {
                                gameSystem.playAgain()
                                                                    gameSystem.currentRound+=1
                                                                    gameSystem.table.isDone = false
                                                                    gameSystem.timerModel.remainingTime = gameSystem.timerModel.timerCount
                                                                    gameSystem.timerModel.timerCount = gameSystem.timerModel.timerCount - 2
                                                                    gameSystem.timerModel.timerIsRunning = true                            } label: {
                                ZStack{
                                    Image("button")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                    Text("Next round")
                                        .font(.title3)
                                        .foregroundColor(Color.white)
                                }.frame(width: 120)
                                                                    .onAppear{
                                                                                                                    gameSystem.timerModel.timerIsRunning = false
                                                                                                                }
                                                                        
                                
                            }

                                    
                            
                        }
                        else {
                            PlayAgainView(score: gameSystem.pointBoardModel.currentPoints).onAppear{
                                print("check achievement")
                                gameSystem.checkAchievement()
                                achievementManager.saveAchievements()
                            }
                        }
                    }
                if (gameSystem.timerModel.isOver && gameSystem.timerModel.timerIsRunning){
                        PlayAgainView(score: gameSystem.pointBoardModel.currentPoints)
                    }
                    
                }
                .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
            
        }
        
        
    }

struct MainNormalView_Previews: PreviewProvider {
    static var previews: some View {
        MainNormalView(difficulty: 4, isContinue: false)
    }
}
