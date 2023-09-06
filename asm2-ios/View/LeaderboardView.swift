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

struct LeaderboardView: View {
    let lang = UserDefaults.standard.string(forKey: "lang")
    var body: some View {
        if lang == "ENG" {
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
                    
                    .onAppear{
                        SoundManager.shared.playSound(named: "interface")
                    }
                    
                }
            }
            }
            else {
                NavigationView{
                List {
                    Text("Top 10 Toàn thời gian").font(.largeTitle)
                    
                    // Retrieve the top 10 high scores
                    Grid{
                        ForEach(0..<min(10, leaderboardManager.getLeaderboard().count), id: \.self) { index in
                            let entry = leaderboardManager.getLeaderboard()[index]
                            GridRow{
                                Text("\(index+1)").font(.headline)
                                Spacer()
                                Text("\(entry.username):").font(.body)
                                Spacer()
                                Text("Điểm: \(entry.score)").font(.body)
                            }
                            
                        }
                    }
                    
                   
                    .onAppear{
                        SoundManager.shared.playSound(named: "interface")
                    }
                    
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
        let lang = UserDefaults.standard.string(forKey: "lang")
        var body: some View {
            if lang == "ENG" {
                NavigationView {
                    VStack {
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
                    }
                    
                }
            }
            else {
                NavigationView {
                    VStack {
                        List(achievementManager.getVieAchievement()) { achievement in
                            HStack{
                                Image(achievement.img)
                                    .padding([.trailing],5)
                                VStack(alignment: .leading) {
                                    Text(achievement.title)
                                        .font(.title)
                                        .fontWeight(.bold)
                                    Text(achievement.description)
                                    if achievement.isUnlocked {
                                        Text("Đã mở!")
                                            .foregroundColor(.green)
                                    } else {
                                        Text("Chưa mở")
                                            .foregroundColor(.red)
                                    }
                                    
                                }
                            }
                        }
                    }
                    
                }

            }
        }
    }

struct HighScoreView : View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass

    var body: some View {
            if horizontalSizeClass == .compact {
                NavigationView {
                // iPhone layout
                TabView {
                    NavigationView {
                        LeaderboardView()
                    }
                    .tabItem {
                        Image(systemName: "list.dash")
                        Text("Leaderboard")
                    }
                    
                    NavigationView {
                        AchievementListView(achievementManager: AchievementManager())
                    }
                    .tabItem {
                        Image(systemName: "star.fill")
                        Text("Achievements")
                    }
                }
                .navigationBarTitle("High Scores")
            }
            } else {
                //ipad layout
                VStack {
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
    
}

    struct HighScoreView_Previews: PreviewProvider {
        static var previews: some View {
            HighScoreView()
        }
    }

