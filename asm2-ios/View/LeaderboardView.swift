//
//  LeaderboardView.swift
//  asm2-ios
//
//  Created by Long Dau Nguyen Hoang on 31.08.23.
//

import SwiftUI

struct LeaderboardView: View {
    @State private var highScores : [Int] = []
    var body: some View {
        NavigationView{
                List(highScores, id: \.self) { item in
                    Text("\(item)")
                }.navigationTitle("Leaderboard")
              

        }
        .onAppear{
            if let savedScores = UserDefaults.standard.array(forKey: "high-score") as? [Int] {
                print("fetch highscore")
                highScores = savedScores
            }
            
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
