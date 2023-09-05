import SwiftUI

struct CountdownTimerView: View {
    @ObservedObject var timerModel : TimerModel
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack {
            Text("\(timeString(timerModel.remainingTime))")
                .font(.custom("Silver", size: 50))
                .foregroundColor(timerModel.timerIsRunning ? .red : colorScheme == .dark ? .white : .black)

            
        }
            }

    // Helper function to convert seconds into a formatted time string (e.g., "01:30")
    func timeString(_ seconds: Int) -> String {
        let minutes = (seconds % 3600) / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

struct CountdownTimerView_Previews: PreviewProvider {
    static var previews: some View {
        let timerModel = TimerModel(timerCount: 10)
        CountdownTimerView(timerModel: timerModel)
    }
}
