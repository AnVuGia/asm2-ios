//
//  TextButtonUI.swift
//  asm2-ios
//
//  Created by An Vu Gia on 18/08/2023.
//

import SwiftUI

struct TextButtonUI: View {
    var content: String
    var body: some View {
        Text(content)
            .font(.custom("Silver", size: 50))
            .fontWeight(.bold)
            .foregroundColor(Color.white)
            .shadow(radius: 5)
            .padding(4)
            .frame(width: 220, height: 60)
            .background(
                RoundedRectangle(cornerRadius: 30)
                .fill(
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color.gray, location: 0),
                            .init(color: Color.white.opacity(0.1), location: 0.3),
                            .init(color: Color.gray, location: 0.7),
                            .init(color: Color.white.opacity(0.1), location: 1)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
            )
            .padding(4)
            .background(Color.black)
            .clipShape(RoundedRectangle(cornerRadius: 40))
    }
}

struct TextButtonUI_Previews: PreviewProvider {
    static var previews: some View {
        TextButtonUI(content: "Game start")
        
    }
}
