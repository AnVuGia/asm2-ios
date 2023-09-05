//
//  DifficultyView.swift
//  asm2-ios
//
//  Created by An Vu Gia on 28/08/2023.
//

import SwiftUI

struct DifficultyView: View {
    private let normalCustomFont : Font = Font.custom("Silver", size: 60)
    @Binding var difficulty : Int
    @State var currentDifficulty = "Easy"
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                .opacity(0.7)
            VStack{
                Text("Current difficulty: \(currentDifficulty)")
                    .font(.custom("Silver", size: 50))
                    .foregroundColor(Color.white)
                Button {
                    difficulty = 1
                    currentDifficulty = "Easy"
                } label: {
                    ZStack{
                        Image("dialog")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        Text("Easy")
                            .font(normalCustomFont)
                            .foregroundColor(Color.black)
                    }
                }
                Button {
                    difficulty = 2
                    currentDifficulty = "Normal"
                } label: {
                    ZStack{
                        Image("dialog")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        Text("Normal")
                            .font(normalCustomFont)
                            .foregroundColor(Color.black)
                    }
                }
                Button {
                    difficulty = 4
                    currentDifficulty = "Hard"
                } label: {
                    ZStack{
                        Image("dialog")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 200)
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        Text("Hard")
                            .font(normalCustomFont)
                            .foregroundColor(Color.black)
                    }
                }

            }
        }.onAppear{
            SoundManager.shared.playSound(named: "interface")
        }
    }
}

struct DifficultyView_Previews: PreviewProvider {
    static var previews: some View {
        @State var difficulty = 1
        DifficultyView(difficulty: $difficulty)
    }
}
