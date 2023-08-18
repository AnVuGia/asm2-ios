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
        }
        .padding(5)
        .padding([.leading, .trailing], 20)
        .background(LinearGradient(colors: [Color.gray, Color.black,Color.gray], startPoint: .top, endPoint: .bottom))
        .clipShape(RoundedRectangle(cornerRadius: 40))
        .shadow(radius: 5)
    }
}


