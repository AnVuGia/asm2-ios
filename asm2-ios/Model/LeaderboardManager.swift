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
import Foundation

struct LeaderboardEntry : Codable {
    let username: String
    let score: Int
}

class LeaderboardManager {
    static let shared = LeaderboardManager()

    private var leaderboard: [LeaderboardEntry] {
        get {
            if let data = UserDefaults.standard.data(forKey: "leaderboard"),
               let leaderboard = try? JSONDecoder().decode([LeaderboardEntry].self, from: data) {
                return leaderboard
            }
            return []
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                UserDefaults.standard.set(data, forKey: "leaderboard")
            }
        }
    }

    func getLeaderboard() -> [LeaderboardEntry] {
        return leaderboard.sorted { $0.score > $1.score }
    }

    func addLeaderboard(username: String, score: Int) {
        var leaderboard = getLeaderboard()
        leaderboard.append(LeaderboardEntry(username: username, score: score))
        leaderboard.sort { $0.score > $1.score }
        if leaderboard.count > 10 {
            leaderboard = Array(leaderboard.prefix(10))
        }
        self.leaderboard = leaderboard
    }

    func getPlaceOfScore(score: Int) -> Int? {
        let leaderboard = getLeaderboard()
        if let index = leaderboard.firstIndex(where: { $0.score == score }) {
            return index + 1 // Add 1 to convert from zero-based index to position
        }
        return nil // Score not found in the list
    }
}
let leaderboardManager = LeaderboardManager()
