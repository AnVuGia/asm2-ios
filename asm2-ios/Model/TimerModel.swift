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
