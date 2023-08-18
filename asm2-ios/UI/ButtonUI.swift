//
//  ButtonUI.swift
//  asm2-ios
//
//  Created by An Vu Gia on 18/08/2023.
//

import SwiftUI

struct ButtonUI: View {
    var content : String
    var action : () -> Void
//    @Binding var isClick : Bool
    var body: some View {
        Button(action: {
            print("start click")}
        ) {
            Text(content)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
                .shadow(radius: 5)
        }
        .padding(5)
        .padding([.leading, .trailing], 20)
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
        .padding([.bottom],1)
        .background(Color.black)
        .clipShape(RoundedRectangle(cornerRadius: 40))
                
            }
}

struct ButtonUI_Previews: PreviewProvider {
    static var previews: some View {
        ButtonUI(content: "Game Start", action: {})
    }
}

