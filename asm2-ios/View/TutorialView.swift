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
    let tutorialPages = [
        TutorialPage(image: "tutorial_image_1", title: "Welcome to PokeFlipper", description: "Learn how to play our amazing game."),
        TutorialPage(image: "tutorial_image_2", title: "Get Started", description: "Swipe through this tutorial to get started."),
    ]

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
