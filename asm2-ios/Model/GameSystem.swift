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
    
    init() {
        self.comboBarModel.attachPointBoard(targetPointBoard: pointBoardModel)
        self.table.attachComboBar(targetComboBar: comboBarModel)
    }
    
}


