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
                    HStack{
                        Text("#")
                        Text("\(item)")
                    }
                }.navigationTitle("Leaderboard")
              

        }
        .onAppear{
            highScores = saveNotes.getLeaderboard()
            }
            
        }
    
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
