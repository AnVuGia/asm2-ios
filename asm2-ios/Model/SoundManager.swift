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
import AVFoundation

class SoundManager {
    static let shared = SoundManager()
    
    private var audioPlayers: [AVAudioPlayer] = []
    
    private init() { }
    
    func playSound(named soundName: String, ofType type: String = "mp3", volume: Float = 1.0, isLooping: Bool = false) {
           if let soundFileURL = Bundle.main.url(forResource: soundName, withExtension: type) {
               do {
                   let audioPlayer = try AVAudioPlayer(contentsOf: soundFileURL)
                   audioPlayers.append(audioPlayer)
                   audioPlayer.volume = volume
                   audioPlayer.numberOfLoops = isLooping ? -1 : 0 // Loop indefinitely if isLooping is true
                   audioPlayer.play()
               } catch {
                   print("Error loading sound file: \(error)")
               }
           }
       }
    
    func stopAllSounds() {
        for audioPlayer in audioPlayers {
            audioPlayer.stop()
        }
        audioPlayers.removeAll()
    }
}
