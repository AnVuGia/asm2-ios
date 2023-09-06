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
            }
        }
        .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)

    }
}
struct firstTabView : View {
    @State private var difficulty : Int = 1
    @State private var playerName = "Unknown"
    var body: some View {
        NavigationStack {
            ZStack {
                Color("background-welcome")
                HStack {
                   
                    VStack{
                        NavigationLink(destination: MainNormalView(difficulty: difficulty, isContinue: false, playerName: playerName), label: {
                            TextButtonUI(content: "Game Start")
                        })
                        .padding([.bottom], 6)
                            
                        NavigationLink {
                            MainNormalView(difficulty: difficulty, isContinue: true, playerName: playerName)
                        } label: {
                            TextButtonUI(content: "Continue")
                        }.padding([.bottom], 6)
                        NavigationLink {
                            DifficultyView(difficulty: $difficulty, playerName: $playerName)
                        } label: {
                            TextButtonUI(content: "Setting")
                        }.padding([.bottom], 6)

                    }
                

                }
            }.ignoresSafeArea()
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
    }
}
struct secondTabView : View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("background-welcome")
                VStack{
                    NavigationLink {
                        TutorialView()
                    } label: {
                        TextButtonUI(content: "How to play")
                    }
                    NavigationLink {
                        HighScoreView()
                    } label: {
                        TextButtonUI(content: "Leaderboard")
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
