//
//  ComboBarModel.swift
//  asm2-ios
//
//  Created by An Vu Gia on 22/08/2023.
//

import Foundation
import SwiftUI
class CombobarModel: ObservableObject {
    @Published var currentCombo : [String] = ["Fire", "Water"]
    @Published  var isResonent : Bool = false
    @Published  var isChaos : Bool =  false
    let colors: [String:Color] = [
        "Fire": Color.red,
        "Water": Color.blue,
        "Grass": Color.green,
        "Chaos": Color.purple,
        "Resonent": Color.yellow
    ]
    func addCombo(element: String) {
        currentCombo.append(element)
    }
}
