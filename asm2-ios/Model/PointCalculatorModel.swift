//
//  PointCalculatorModel.swift
//  asm2-ios
//
//  Created by An Vu Gia on 22/08/2023.
//

import Foundation
import SwiftUI


class PointCalculatorModel: ObservableObject {
    @Published var currentPoints = 0
    @State var  difficultyMulti : Int
    init(currentPoints: Int = 0, difficultyMulti: Int) {
        self.currentPoints = currentPoints
        self.difficultyMulti = difficultyMulti
    }
    func addPoints(points: Int, multiplier: Int) {
        currentPoints += points * multiplier * difficultyMulti
    }
}
