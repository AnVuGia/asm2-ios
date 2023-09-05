//
//  asm2_iosApp.swift
//  asm2-ios
//
//  Created by An Vu Gia on 18/08/2023.
//

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
