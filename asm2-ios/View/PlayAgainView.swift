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

struct PlayAgainView: View {
    var score :Int
    @State private var currentPlace = 0
    private let normalCustomFont : Font = Font.custom("Silver", size: 40)
    let playerName : String
    init(score: Int, playerName : String) {
        self.score = score
        self.playerName = playerName
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
                        .font(.custom("Silver", size: 90))
                    Text("Your score: \(score)")
                        .foregroundColor(Color.white)
                        .font(normalCustomFont)
                    if(currentPlace > 0){
                        Text("Your place: #\(currentPlace)")
                            .foregroundColor(Color.white)
                            .font(normalCustomFont)
                    } else {
                        Text("Your place: None")
                            .foregroundColor(Color.white)
                            .font(normalCustomFont)
                    }
                    NavigationLink(destination: WelcomeView()) {
                        ZStack{
                            Image("button")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 150)
                            Text("Play Again")
                                .foregroundColor(Color.white)
                                .font(normalCustomFont)
                            
                        }
                        
                    }
                }
            }.onAppear {
                SoundManager.shared.stopAllSounds()
                SoundManager.shared.playSound(named: "end")
                print("Play again view")
                leaderboardManager.addLeaderboard(username: playerName , score: score)
                if let index = leaderboardManager.getPlaceOfScore(score: score) {
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
        PlayAgainView(score: 200, playerName: "test")
    }
}
