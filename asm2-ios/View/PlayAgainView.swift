//
//  PlayAgainView.swift
//  asm2-ios
//
//  Created by An Vu Gia on 25/08/2023.
//

import SwiftUI

struct PlayAgainView: View {
    var score :Int
    private var currentPlace = 0
    init(score: Int) {
        self.score = score
    
        if var scores = UserDefaults.standard.array(forKey: "high-score") as? [Int] {
            scores.append(score)
            scores.sort()
            if let currentPlace = scores.firstIndex(of: score) {
                // Update UserDefaults with the new sorted array
                UserDefaults.standard.set(scores, forKey: "high-score")
                
                // You can use the currentPlace index as needed
                print("New score's index: \(currentPlace)")
            } else {
                // Handle the case when the score's index is nil (not found)
            }
        } else {
            // Handle the case when high-score is nil or cannot be cast to [Int]
            // For example, you might want to set a default value or perform other actions.
        }

        
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
                    Text("You place: #\(currentPlace + 1)")
                        .foregroundColor(Color.white)
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
            }
        }.navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        
    }
}

struct PlayAgainView_Previews: PreviewProvider {
    static var previews: some View {
        PlayAgainView(score: 1000)
    }
}
