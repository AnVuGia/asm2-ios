//
//  GameSystem.swift
//  asm2-ios
//
//  Created by An Vu Gia on 22/08/2023.
//

import Foundation
import SwiftUI

class GameSystem : ObservableObject {
    @Published var pointBoardModel = PointCalculatorModel()
    @Published var comboBarModel = CombobarModel()
    @Published var table = TableModel()
    @State var UserHighScore = UserDefaults.standard.array(forKey: "high-score")
    @State var highScore : [Int] = []
    init() {
        self.comboBarModel.attachPointBoard(targetPointBoard: pointBoardModel)
        self.table.attachComboBar(targetComboBar: comboBarModel)
    }
    func playAgain(){
        self.table = TableModel()
        table.attachComboBar(targetComboBar: comboBarModel)
        self.table.isDone = false
    }
    func endGame(){
        highScore.append(pointBoardModel.currentPoints)
        UserDefaults.standard.set(UserHighScore , forKey: "high-score")
    }
}


