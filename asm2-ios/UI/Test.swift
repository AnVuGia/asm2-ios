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

struct TestView: View {
    @State private var isShining = false
    
    var body: some View {
        VStack {
            Circle()
                .fill(
                    RadialGradient(
                        gradient: Gradient(stops: [
                            .init(color: Color.yellow, location: 0),
                            .init(color: Color.white, location: isShining ? 0.5 : 0.6),
                            .init(color: Color.yellow, location: 1)
                        ]),
                        center: .center,
                        startRadius: 0,
                        endRadius: isShining ? 100 : 110
                    )
                )
                .frame(width: 100, height: 100)
                .overlay(
                    Circle()
                        .stroke(Color.white, lineWidth: 4)
                        .opacity(isShining ? 0.5 : 0)
                )
                .shadow(color: .yellow, radius: isShining ? 10: 0)
                .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true))
            
            Button("Toggle Shine") {
                isShining.toggle()
            }
            .padding()
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
