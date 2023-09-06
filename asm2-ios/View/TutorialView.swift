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

struct TutorialPage: View {
    var image: String
    var title: String
    var description: String

    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
            
            Text(title)
                .font(.title)
                .padding(.top, 20)
            
            Text(description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 20)
            
            Spacer()
        }
    }
}

struct TutorialView: View {
    let lang = UserDefaults.standard.string(forKey: "lang")
    @State var tutorialPages : [TutorialPage] = []
    init(){
        if lang == "ENG" {
            tutorialPages = [
               TutorialPage(image: "tutorial_image_1", title: "Welcome to PokeFlipper", description: "Learn how to play our amazing game."),
               TutorialPage(image: "tutorial_image_2", title: "Get Started", description: "Swipe through this tutorial to get started."),
           ]
        } else {
            tutorialPages = [
               TutorialPage(image: "tutorial_image_1", title: "Chào mừng tới PokeFlipper", description: "Hãy cùng nhau học cách chơi nào!."),
               TutorialPage(image: "tutorial_image_2", title: "Bắt đầu!", description: "Trượt qua phải để xem tiếp tục"),
           ]

        }
    }
    var body: some View {
        TabView {
            ForEach(tutorialPages, id: \.title) { page in
                page
                    .padding()
                    .tag(page.title)
            }
            TutorialFlip()
            ComboTutorial()
            ComboTutorial2()
            PikachuTutorialView()
            MultiplierView()
            TimerTutorial()
        }
        .onAppear{
            SoundManager.shared.playSound(named: "interface")
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
