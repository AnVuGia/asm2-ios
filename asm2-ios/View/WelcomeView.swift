//
//  WelcomeView.swift
//  asm2-ios
//
//  Created by An Vu Gia on 18/08/2023.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
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
                    Image("poke-ball")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 130, height: 100)
                        
                }.offset(x:0,y:105)
                
                VStack{
                    ButtonUI(content: "Start Game") {
                        
                    }
                    ButtonUI(content: "Leaderboard", action:   {})
                    ButtonUI(content: "How to play", action: {})
               
                    ButtonUI(content: "Setting", action: {})

                                 }.offset(x:0,y:160)

                
                
                Spacer()
                   
                
            }
            
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
