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
import SwiftUI
struct Achievement: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var description: String
    var isUnlocked: Bool = false
    var img: String
}
class AchievementManager : ObservableObject {
    // List of achievements
    @Published var achievements: [Achievement] = []
    
    // UserDefaults key for storing achievements
    private let achievementsKey = "AchievementsKey"
    
    init() {
        // Load achievements from UserDefaults during initialization
        if let savedAchievementsData = UserDefaults.standard.data(forKey: achievementsKey) {
            if let savedAchievements = try? JSONDecoder().decode([Achievement].self, from: savedAchievementsData) {
                achievements = savedAchievements
            }
        } else{
            achievements = [
            Achievement(title: "Getting Started!", description: "Defeat the game in easy mode", isUnlocked: false, img: "easy-cup"),
            Achievement(title: "Still too easy...", description: "Defeat the game in normal mode",
                isUnlocked: false , img: "normal-cup"),
            Achievement(title: "G.O.A.T", description: "Defeat the game in hard mode", img: "hard-cup")
            ]
        }
    }
    
    // Method to save achievements to UserDefaults
    func saveAchievements() {
        if let encodedAchievements = try? JSONEncoder().encode(achievements) {
            UserDefaults.standard.set(encodedAchievements, forKey: achievementsKey)
        }
    }
    
    // Method to unlock an achievement
    func unlockAchievement(achievement: Achievement) {
        guard let index = achievements.firstIndex(where: { $0.id == achievement.id }) else { return }
        achievements[index].isUnlocked = true
        saveAchievements()
    }
    

    
    // Method to add a new achievement
    func addAchievement(title: String, description: String, img: String) {
        let achievement = Achievement(title: title, description: description, img: img)
        achievements.append(achievement)
        saveAchievements()
    }
    
    // Method to reset all achievements
    func resetAchievements() {
        achievements = []
        UserDefaults.standard.removeObject(forKey: achievementsKey)
    }
}
let achievementManager = AchievementManager()

