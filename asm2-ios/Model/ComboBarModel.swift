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
class CombobarModel: ObservableObject {
    @Published var currentCombo : [String] = []
    @Published  var isResonent : Bool = false
    @Published  var isChaos : Bool =  false
    @Published var pointBoard : PointCalculatorModel
    private let basePoints = 200
    init() {
        self.currentCombo = []
        self.isResonent = false
        self.isChaos = false
        self.pointBoard = PointCalculatorModel(difficultyMulti: 1)
    }
    let colors: [String:Color] = [
        "Fire": Color.red,
        "Water": Color.blue,
        "Grass": Color.green,
        "Chaos": Color.purple,
        "Resonent": Color.yellow
    ]
    func addCombo(element: String) {
        currentCombo.append(element)
        saveNotes.storeCurrentComboBar(currentComboBar: self.currentCombo, isResonace: self.isResonent, isChaos: self.isChaos)
        let multiplier = checkCombo(element: element)
        print("count: \(currentCombo.count)")
        pointBoard.addPoints(points: basePoints, multiplier: multiplier)
        if(multiplier >= 2){
            SoundManager.shared.playSound(named: "combo")
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.clearCombo()
            }
        }
    }
    func checkCombo(element:String)->Int{
        if(currentCombo.count == 3) {
            if(isChaos && isResonent){
                isChaos = false
                isResonent = false
                return 4
            }
            
            if(areAllStringsEqual(in: currentCombo)){
                isResonent = true
                return 3
            } else if (areAllStringsUnique(in: currentCombo)){
                isChaos = true
                return 3
            } else {
                if isChaos {isResonent = true}
                else if isResonent {isChaos = true}
                else {isResonent = true}
                return 2
            }
        } else if (element == "Electric") {
            currentCombo.remove(at: currentCombo.count-1)
            if isChaos {isResonent = true}
            else if isResonent {isChaos = true}
            else {isResonent = true}
        }
        return 1
    }
    func clearCombo(){
        currentCombo.removeAll()
    }
    func attachPointBoard(targetPointBoard: PointCalculatorModel) {
        self.pointBoard = targetPointBoard
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
