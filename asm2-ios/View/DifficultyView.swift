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
    @Binding var playerName : String
    @State private var text : String = ""
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
                Text("Enter your name")
                    .font(.custom("Silver", size: 50))
                    .foregroundColor(Color.white)
                TextField("Your name: ", text: $text)
                    .font(.custom("Silver", size: 50))
                
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: UIScreen.main.bounds.width-200)
                
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
            text = playerName
        }
        .onDisappear{
            playerName = text
        }
    }
}

struct DifficultyView_Previews: PreviewProvider {
    static var previews: some View {
        @State var difficulty = 1
        @State var playerName = "Test"
        DifficultyView(difficulty: $difficulty, playerName: $playerName)
    }
}
