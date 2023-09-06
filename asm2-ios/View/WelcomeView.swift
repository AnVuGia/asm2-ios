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

struct WelcomeView: View {
    @State private var selectedTab = 0
    var body: some View {
        NavigationStack {
            ZStack {
                ZStack {
                    Image("welcome-background")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: UIScreen.main.bounds.width-100, height: UIScreen.main.bounds.height)
                    .ignoresSafeArea()
                    Image("poke-logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width - 30,height: UIScreen.main.bounds.height-200, alignment: .top)
                        .shadow(color: Color.yellow, radius: 13)
                }
                            VStack {
                                Spacer()
                                HStack {
                                    Button {
                                        if selectedTab > 0 {
                                            SoundManager.shared.playSound(named: "interface")
                                        selectedTab -= 1
                                        }
                                    } label: {
                                        Image("prev-button")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                    }.disabled(selectedTab == 0)

                                    TabView(selection: $selectedTab) {
                                            firstTabView().tag(0)
                                            secondTabView().tag(1)
                                        }
                                    .frame(width: UIScreen.main.bounds.width-150, height: 360)
                                    Button {
                                        if selectedTab < 1 {
                                            SoundManager.shared.playSound(named: "interface")
                                            selectedTab += 1
                                        }
                                    } label: {
                                        Image("next-button")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                    }.disabled(selectedTab == 1)

                                    
                                }
                
                            }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                
                    
                    
                       }
            .onAppear{
                SoundManager.shared.stopAllSounds()
                SoundManager.shared.playSound(named: "welcome-theme", volume: 0.5, isLooping: true)
                if let currLang = UserDefaults.standard.string(forKey: "lang") {
                    
                } else {
                    let temp = "ENG"
                    UserDefaults.standard.set(temp, forKey: "lang")
                }

            }
        }
        .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)

    }
}
struct firstTabView : View {
    @State private var difficulty : Int = 1
    @State private var playerName = "Unknown"
    @State var lang = "ENG"
    var body: some View {
        NavigationStack {
            ZStack {
                Color("background-welcome")
                HStack {
                   
                    VStack{
                        NavigationLink(destination: MainNormalView(difficulty: difficulty, isContinue: false, playerName: playerName), label: {
                            if lang == "ENG" {
                                TextButtonUI(content: "Game Start")
                            } else {
                                TextButtonUI(content: "Bat dau")

                            }
                        })
                        .padding([.bottom], 6)
                            
                        NavigationLink {
                            MainNormalView(difficulty: difficulty, isContinue: true, playerName: playerName)
                        } label: {
                            if lang == "ENG" {
                                TextButtonUI(content: "Continue")
                            } else {
                                TextButtonUI(content: "Tiep tuc")

                            }
                            
                        }.padding([.bottom], 6)
                        NavigationLink {
                            DifficultyView(difficulty: $difficulty, playerName: $playerName, bindLang: $lang)
                        } label: {
                            if lang == "ENG" {
                                TextButtonUI(content: "Setting")
                            } else {
                                TextButtonUI(content: "Thiet lap")

                            }
                        }.padding([.bottom], 6)

                    }
                

                }.onAppear{
                    if let temp = UserDefaults.standard.string(forKey: "lang") {
                        lang = temp
                    }
                }
            }.ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}
struct secondTabView : View {
    let lang = UserDefaults.standard.string(forKey: "lang")
    var body: some View {
        NavigationStack {
            ZStack {
                Color("background-welcome")
                VStack{
                    NavigationLink {
                        TutorialView()
                    } label: {
                        if lang == "ENG" {
                            TextButtonUI(content: "How to play")
                        } else {
                            TextButtonUI(content: "Huong dan")

                        }
                    }
                    NavigationLink {
                        HighScoreView()
                    } label: {
                        if lang == "ENG" {
                            TextButtonUI(content: "Leaderboard")
                        } else {
                            TextButtonUI(content: "Xep hang")

                        }
                    }
                }
            }.ignoresSafeArea()
        }.navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
