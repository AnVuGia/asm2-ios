//
//  ComboBarModel.swift
//  asm2-ios
//
//  Created by An Vu Gia on 22/08/2023.
//

import Foundation
import SwiftUI
class CombobarModel: ObservableObject {
    @Published var currentCombo : [String] = []
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
        print("count: \(currentCombo.count)")
        if(checkCombo() >= 1){
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.clearCombo()
            }
        }
    }
    func checkCombo()->Int{
        if(currentCombo.count == 3) {
            if(isChaos && isResonent){
                isChaos = false
                isResonent = false
                return 3
            }
            
            if(areAllStringsEqual(in: currentCombo)){
                isResonent = true
                return 2
            } else if (areAllStringsUnique(in: currentCombo)){
                isChaos = true
                return 2
            } else {
                if isChaos {isResonent = true}
                else if isResonent {isChaos = true}
                else {isChaos = true}
                return 1
            }
        }
        return 0
    }
    func clearCombo(){
        currentCombo.removeAll()
    }
}
func areAllStringsEqual(in array: [String]) -> Bool {
    guard let firstString = array.first else {
        // If the array is empty, consider it as all strings being the same.
        return true
    }
    
    for string in array {
        if string != firstString {
            return false
        }
    }
    
    return true
}
func areAllStringsUnique(in array: [String]) -> Bool {
    var seenStrings = Set<String>()
    
    for string in array {
        if seenStrings.contains(string) {
            return false // This string has already been seen, so it's not unique.
        }
        seenStrings.insert(string)
    }
    
    return true
}
