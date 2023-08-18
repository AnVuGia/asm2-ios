//
//  ShiningView.swift
//  asm2-ios
//
//  Created by An Vu Gia on 18/08/2023.
//

import SwiftUI

struct ShiningView: View {
    @Binding var isShining : Bool
    var shineColor : Color
    var size : CGFloat
    var shadowSize: CGFloat
    var body: some View {
        VStack {
            Circle()
                .fill(
                    RadialGradient(
                        gradient: Gradient(stops: [
                            .init(color: shineColor, location: 0),
                            .init(color: Color.white, location: isShining ? 0.5 : 0.6),
                            .init(color: shineColor, location: 1)
                        ]),
                        center: .center,
                        startRadius: 0,
                        endRadius: isShining ? 100 : 110
                    )
                )
                .frame(width: size, height: size)
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 4)
                        .opacity(isShining ? 0.5 : 0)
                )
                .shadow(color: shineColor, radius: isShining ? shadowSize : 0)
                .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true),value: isShining)            
        }
    }
}

