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
var saveNotes = SaveNotes()
class SaveNotes {
    private var cards =  UserDefaults.standard.array(forKey: "cards")
    private var discardCards = UserDefaults.standard.array(forKey: "discardCards")
    private var isClicks = UserDefaults.standard.array(forKey: "isClicks")
    private var currentComboBar = UserDefaults.standard.array(forKey: "currentComboBar")
    private var currentPoints = UserDefaults.standard.integer(forKey: "currentPoints")
    private var currentRound = UserDefaults.standard.integer(forKey: "currentRound")
    private var isChaos = UserDefaults.standard.bool(forKey: "isChaos")
    private var isResonance = UserDefaults.standard.bool(forKey: "isResonance")
    private var difficulty = UserDefaults.standard.integer(forKey: "difficulty")
    private var leaderBoard : [Int] = []
    func storeTable (cards: [[Int]] , discardCards: [Int], isClicks : [[Bool]]){
        UserDefaults.standard.set(cards, forKey: "cards")
        UserDefaults.standard.set(discardCards , forKey: "discardCards")
        UserDefaults.standard.set(isClicks , forKey: "isClicks")
    }
    func storeCurrentComboBar(currentComboBar : [String], isResonace : Bool, isChaos : Bool){
        UserDefaults.standard.set(currentComboBar, forKey: "currentComboBar")
        UserDefaults.standard.set(isResonace, forKey: "isResonance")
        UserDefaults.standard.set(isChaos, forKey: "isChaos")
    }
    func storeCurrentRound(currentRound: Int){
        UserDefaults.standard.set(currentRound, forKey: "currentRound")
    }
    func storeCurrentPoints(currentPoints: Int){
        UserDefaults.standard.set(currentPoints, forKey: "currentPoints")        }
    func storeDifficulty(difficulty: Int){
        UserDefaults.standard.set(difficulty, forKey: "difficulty")
    }
    func storeLeaderboard(scores: [Int]) {
        UserDefaults.standard.set(scores, forKey: "highScores")
        
    }


}
