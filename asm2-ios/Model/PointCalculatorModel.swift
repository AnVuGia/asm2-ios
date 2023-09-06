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


class PointCalculatorModel: ObservableObject {
    @Published var currentPoints = 0
    @Published var  difficultyMulti : Int
    init(currentPoints: Int = 0, difficultyMulti: Int) {
        self.currentPoints = currentPoints
        self.difficultyMulti = difficultyMulti
    }
    func addPoints(points: Int, multiplier: Int) {
        print("Mulitplier: \(difficultyMulti)")
        currentPoints += points * multiplier * difficultyMulti
        saveNotes.storeCurrentPoints(currentPoints: currentPoints)
    }
    func setDifficultyMulti(difficulty : Int){
        difficultyMulti = difficulty
    }
}
