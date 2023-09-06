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

import SwiftUI

@main

struct asm2_iosApp: App {
    static let customFont: Font = Font.custom("Silver", size: 20)
    var body: some Scene {
        WindowGroup {
            WelcomeView()
                .environment(\.font, Font.custom("Silver", size: 20))
            
        }
    }
}
