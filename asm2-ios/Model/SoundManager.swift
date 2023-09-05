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
