//
//  LeaderboardView.swift
//  asm2-ios
//
//  Created by Long Dau Nguyen Hoang on 31.08.23.
//

import SwiftUI

struct LeaderboardView: View {
    var body: some View {
        NavigationView {
            List {
                Text("Top 10 All-Time").font(.largeTitle)
                
                // Retrieve the top 10 high scores
                                    Grid{
                        ForEach(0..<min(10, leaderboardManager.getLeaderboard().count), id: \.self) { index in
                            let entry = leaderboardManager.getLeaderboard()[index]
                            GridRow{
                                Text("\(index+1)").font(.headline)
                                Spacer()
                                Text("\(entry.username):").font(.body)
                                Spacer()
                                Text("Score: \(entry.score)").font(.body)
                            }
                            
                        }
                    }
                    
                    .navigationBarTitle("Leaderboard")
                    .onAppear{
                        SoundManager.shared.playSound(named: "interface")
                }
                
            }
        }
    }
}
    
    struct LeaderboardRow: View {
        let username: String
        let score: Int
        let position: Int
        
        var body: some View {
            HStack {
                Text("\(position)").font(.headline)
                Spacer()
                Text("\(username):").font(.body)
                Text("Score: \(score)").font(.body)
                Spacer()
            }
        }
    }
    struct AchievementListView: View {
        @ObservedObject var achievementManager: AchievementManager
        
        var body: some View {
            NavigationView {
                List(achievementManager.achievements) { achievement in
                    HStack{
                        Image(achievement.img)
                            .padding([.trailing],5)
                        VStack(alignment: .leading) {
                            Text(achievement.title)
                                .font(.title)
                                .fontWeight(.bold)
                            Text(achievement.description)
                            if achievement.isUnlocked {
                                Text("Unlocked!")
                                    .foregroundColor(.green)
                            } else {
                                Text("Locked")
                                    .foregroundColor(.red)
                            }
                            
                        }
                    }
                }
                .navigationBarTitle("Achievements")
            }
        }
    }

    struct HighScoreView : View {
        var body: some View{
            ScrollView{
                LeaderboardView()
                AchievementListView(achievementManager: achievementManager)
            }
        }
    }
    struct HighScoreView_Previews: PreviewProvider {
        static var previews: some View {
            HighScoreView()
        }
    }

