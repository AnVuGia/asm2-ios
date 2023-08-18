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
    var body: some View {
        NavigationStack {
            ZStack {
                Image("welcome-background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .offset(x:-45, y: 0)
                VStack{
                    Image("poke-logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .shadow(color: Color.yellow, radius: 13)
                        .offset(x:0, y:60)
                    Button(action:  {
                        print("Click")
                    }) {
                        ZStack {
                            ShiningView(isShining: $isStart, shineColor: Color.white, size: 100, shadowSize: 15)
                            Image("poke-ball")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                            .frame(width: 130, height: 100)
                        }.rotationEffect(.degrees( isStart ? 360 : 0))
                            .animation(.linear(duration: 1), value: isStart)
                            
                    }.offset(x:0,y:105)
                    
                    VStack{
                        ButtonUI(content: "Start Game") {
                            isStart.toggle()
                            if isStart {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                                    navigationNextView.toggle()
                                    print("Navigation next view: \(navigationNextView)")
                                }
                            }
                            
                        }
                        if navigationNextView {
                            NavigationLink(destination: MainPageView(), isActive: $navigationNextView){
                                EmptyView()
                            }
                        }
                        ButtonUI(content: "Leaderboard", action:   {})
                        ButtonUI(content: "How to play", action: {})
                   
                        ButtonUI(content: "Setting", action: {})

                                     }.offset(x:0,y:160)

                    
                    
                    Spacer()
                       
                    
                }
                
            }
        }.onDisappear(){
            isStart = false
            navigationNextView = false
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
