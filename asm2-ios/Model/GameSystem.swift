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

import Foundation
import SwiftUI

class GameSystem : ObservableObject {
    @Published var pointBoardModel = PointCalculatorModel(difficultyMulti: 1)
    @Published var comboBarModel = CombobarModel()
    @Published var table = TableModel()
    @Published var timerModel = TimerModel(timerCount: 10)
    @Published var playerName : String = ""
    @State var highScore : [Int] = []
    @State var difficulty : Int = 1
    @Published var currentRound : Int = 1
        init(difficulty : Int) {
        self.comboBarModel.attachPointBoard(targetPointBoard: pointBoardModel)
        self.table.attachComboBar(targetComboBar: comboBarModel)
        self.table.attachTimer(timerModel: timerModel)
        self.difficulty = difficulty
        }
    func playAgain(){
        self.table = TableModel()
        table.attachComboBar(targetComboBar: comboBarModel)
        self.table.isDone = false
        table.attachTimer(timerModel: timerModel)
    }
    func endGame(){
        self.checkAchievement()
        achievementManager.saveAchievements()
    }
    func attachTimerModel(timerModel: TimerModel){
        self.timerModel = timerModel
        table.attachTimer(timerModel: timerModel)
    }
    func load() {
        self.pointBoardModel.currentPoints  = UserDefaults.standard.integer(forKey: "currentPoints")
        
        if let myArray = UserDefaults.standard.array(forKey: "currentComboBar") as? [String] {
            self.comboBarModel.currentCombo = myArray
        } else {
            print("Value not found in UserDefaults currentCombo")
        }
        
        self.comboBarModel.isChaos = UserDefaults.standard.bool(forKey: "isChaos")
        self.comboBarModel.isResonent = UserDefaults.standard.bool(forKey: "isResonance")
        
        if let myArray = UserDefaults.standard.array(forKey: "cards") as? [[Int]] {
            self.table.cards = myArray
                } else {
            print("Value not found in UserDefaults cards")
        }
        
        if let myArray = UserDefaults.standard.array(forKey: "isClicks") as? [[Bool]] {
            self.table.isClicks  = myArray
        } else {
            print("Value not found in UserDefaults isClicks")
        }
        
        if let myArray = UserDefaults.standard.array(forKey: "discardCards") as? [Int] {
            self.table.discardCard = myArray
        } else {
            print("Value not found in UserDefaults discardCards")
        }
        
        self.currentRound = UserDefaults.standard.integer(forKey: "currentRound")
        self.difficulty = UserDefaults.standard.integer(forKey: "difficulty")
        if let playerName = UserDefaults.standard.string(forKey: "playerName") {
            // Use the retrieved playerName
            print("Player Name: \(playerName)")
        } else {
            // Player name not found in UserDefaults, handle this case accordingly
            print("Player Name not found.")
        }

    }
    func setDifficulty(difficulty: Int){
     
        self.difficulty = difficulty
        self.pointBoardModel.setDifficultyMulti(difficulty: difficulty)
    }
    func setPlayerName(playerName: String){
        self.playerName = playerName
    }
    func checkAchievement(){
        if(currentRound >= 5){
            if(difficulty == 1){
                achievementManager.achievements[0].isUnlocked = true
            } else if (difficulty == 2){
                achievementManager.achievements[1].isUnlocked = true
            } else if (difficulty == 4) {
                achievementManager.achievements[2].isUnlocked = true
            }
        }
    }
}

