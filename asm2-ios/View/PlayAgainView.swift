//
//  PlayAgainView.swift
//  asm2-ios
//
//  Created by An Vu Gia on 25/08/2023.
//

import SwiftUI

struct PlayAgainView: View {
    var score :Int
    @State private var currentPlace = 0
    init(score: Int) {
        self.score = score
    }
    var body: some View {
        NavigationStack{
            ZStack {
                Color.black
                    .ignoresSafeArea()
                    .opacity(0.7)
                
                VStack {
                    Text("GAME OVER")
                        .foregroundColor(Color.white)
                        .font(.largeTitle)
                    Text("Your score: \(score)")
                        .foregroundColor(Color.white)
                    if(currentPlace > 0){
                        Text("Your place: #\(currentPlace)")
                            .foregroundColor(Color.white)
                    } else {
                        Text("Your place: None")
                            .foregroundColor(Color.white)                    }
                    NavigationLink(destination: WelcomeView()) {
                        ZStack{
                            Image("button")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                            Text("Play Again")
                                .foregroundColor(Color.white)
                            
                        }
                        
                    }
                }
            }.onAppear {
                print("Play again view")
                saveNotes.addLeaderboard(score: score)
                if let index = saveNotes.getPlaceOfScore(score: score) {
                    currentPlace = index
                } else {
                    currentPlace = -1
                }
            }
        }.navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        
    }
}

struct PlayAgainView_Previews: PreviewProvider {
    static var previews: some View {
        PlayAgainView(score: 200)
    }
}
