//
//  WelcomeView.swift
//  asm2-ios
//
//  Created by An Vu Gia on 18/08/2023.
//

import SwiftUI

struct WelcomeView: View {
    @State private var isStart = false
    @State private var navigationNextView = false
    @State private var difficulty = 1
    var body: some View {
        NavigationStack {
            ZStack {
                Image("welcome-background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width-100)
                    .ignoresSafeArea()
                    

                    Image("poke-logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width - 30,height: UIScreen.main.bounds.height-200, alignment: .top)
                        .shadow(color: Color.yellow, radius: 13)
                        
                        ZStack {
                            ShiningView(isShining: $isStart, shineColor: Color.white, size: 100, shadowSize: 15)
                            Image("poke-ball")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                            .frame(width: 130, height: 100)
                            .onAppear {
                                isStart = true
                            }
                        }.rotationEffect(.degrees(isStart ? 360 : 0))
                            .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: isStart)
                            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height+20, alignment: .center)
                            
                    
                VStack{
                    NavigationLink(destination: MainNormalView(difficulty: difficulty, isContinue: false), label: {
                        TextButtonUI(content: "Game Start")
                        
                    })
                    NavigationLink {
                        MainNormalView(difficulty: difficulty, isContinue: true)
                    } label: {
                        TextButtonUI(content: "Continue")
                    }
                    
                    NavigationLink {
                        TutorialView()
                    } label: {
                        TextButtonUI(content: "How to play")
                    }
                    NavigationLink {
                        
                    } label: {
                        TextButtonUI(content: "Leaderboard")
                    }
                    NavigationLink {
                        DifficultyView(difficulty: $difficulty)
                    } label: {
                        TextButtonUI(content: "Setting")
                    }
                   
                }.frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height-80, alignment: .bottom)
                    Spacer()
            }
        }.onDisappear(){
        }
        .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)

    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
