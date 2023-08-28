//
//  TimerModel.swift
//  asm2-ios
//
//  Created by An Vu Gia on 25/08/2023.
//

import Foundation
import SwiftUI

class TimerModel : ObservableObject {
    var timerCount : Int
    @Published var remainingTime : Int// Initial time in seconds
    @Published  var timerIsRunning = false
    @Published var isOver : Bool = false
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    init(timerCount: Int){
        self.timerCount = timerCount
        self.remainingTime = timerCount
        self.timerIsRunning = false
        self.isOver = false
    }
    func start(){
        isOver = false
        remainingTime = timerCount
        timerIsRunning = true
    }
   
}
