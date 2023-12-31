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

struct DifficultyView: View {
    private let normalCustomFont : Font = Font.custom("Silver", size: 60)
    @Binding var difficulty : Int
    @Binding var playerName : String
    @Binding var bindLang : String
    @State private var text : String = ""
    @State var currentDifficulty = "Easy"
    @State private var currentLang = "VIE"
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                .opacity(0.7)
            VStack{
                Text("Current difficulty: \(currentDifficulty)")
                    .font(.custom("Silver", size: 50))
                    .foregroundColor(Color.white)
                Text("Enter your name")
                    .font(.custom("Silver", size: 50))
                    .foregroundColor(Color.white)
                TextField("Your name: ", text: $text)
                    .font(.custom("Silver", size: 50))
                
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: UIScreen.main.bounds.width-200)
                
                HStack {
                    Button {
                        difficulty = 1
                        currentDifficulty = "Easy"
                    } label: {
                        DialogButton(text: "Easy")
                    }
                    
                    Button {
                        difficulty = 2
                        currentDifficulty = "Normal"
                    } label: {
                        DialogButton(text: "Normal")
                    }
                    Button {
                        difficulty = 4
                        currentDifficulty = "Hard"
                    } label: {
                        DialogButton(text: "Hard")
                    }
                }
                HStack {
                    Text("Theme: ")
                            .font(.custom("Silver", size: 50))
                        .foregroundColor(Color.white)
                    Button {
                        toggleColorScheme()
                       
                    } label: {
                        if (colorScheme == .dark){
                            DialogButton(text: "Dark")
                        } else {
                            DialogButton(text: "Light")
                        }
                    }

                }
                Text("Current Language: \(currentLang)")
                        .font(.custom("Silver", size: 50))
                    .foregroundColor(Color.white)
                HStack {
                    Button {
                        currentLang = "ENG"
                        UserDefaults.standard.set(currentLang, forKey: "lang")
                        bindLang = currentLang
                    } label: {
                        DialogButton(text: "ENG")
                       
                    }
                    Button {
                        currentLang = "VIE"
                        UserDefaults.standard.set(currentLang, forKey: "lang")
                        bindLang = currentLang
                    } label: {
                        DialogButton(text: "VIE")
                                            }

                }
                
                
                
                   

                
            }
        }.onAppear{
            SoundManager.shared.playSound(named: "interface")
            text = playerName
            if let currLang = UserDefaults.standard.string(forKey: "lang") {
                currentLang = currLang
            } else {
                let temp = "ENG"
                UserDefaults.standard.set(temp, forKey: "lang")
            }
        }
        .onDisappear{
            playerName = text
        }
    }
    private func toggleColorScheme() {
           if colorScheme == .light {
               UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .dark
           } else {
               UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .light
           }
       }
}
struct DialogButton : View {
    var text : String
    private let normalCustomFont : Font = Font.custom("Silver", size: 40)
    var body: some View{
        ZStack{
            Image("dialog")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 120)
                .clipShape(RoundedRectangle(cornerRadius: 15))
            Text("\(text)")
                .font(normalCustomFont)
                .foregroundColor(Color.black)
        }
    }
}

struct DifficultyView_Previews: PreviewProvider {
    static var previews: some View {
        @State var difficulty = 1
        @State var playerName = "Test"
        @State var lang = "ENG"
        DifficultyView(difficulty: $difficulty, playerName: $playerName, bindLang: $lang )
    }
}
