//
//  GameSystem.swift
//  asm2-ios
//
//  Created by An Vu Gia on 22/08/2023.
//

import Foundation
import SwiftUI

class GameSystem : ObservableObject {
    @Published var pointBoardModel = PointCalculatorModel(difficultyMulti: 1)
    @Published var comboBarModel = CombobarModel()
    @Published var table = TableModel()
    @Published var timerModel = TimerModel(timerCount: 10)
    @State var UserHighScore = UserDefaults.standard.array(forKey: "high-score")
    @State var highScore : [Int] = []
    @State var difficulty : Int = 1
    @Published var currentRound : Int = 1
    init(difficulty : Int) {
        self.comboBarModel.attachPointBoard(targetPointBoard: pointBoardModel)
        self.table.attachComboBar(targetComboBar: comboBarModel)
        self.table.attachTimer(timerModel: timerModel)
        self.difficulty = difficulty
        self.pointBoardModel.difficultyMulti = difficulty
        }
    func playAgain(){
        self.table = TableModel()
        table.attachComboBar(targetComboBar: comboBarModel)
        self.table.isDone = false
        table.attachTimer(timerModel: timerModel)
    }
    func endGame(){
        highScore.append(pointBoardModel.currentPoints)
        UserDefaults.standard.set(UserHighScore , forKey: "high-score")
    }
    func attachTimerModel(timerModel: TimerModel){
        self.timerModel = timerModel
        table.attachTimer(timerModel: timerModel)
    }
    func save() {
        
    }
}


