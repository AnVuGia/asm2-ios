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
    
    func addPoints(points: Int, multiplier: Int) {
        currentPoints += points * multiplier
    }
}
