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
        TutorialPage(image: "tutorial_image_1", title: "Welcome to MyApp", description: "Learn how to use our amazing app."),
        TutorialPage(image: "tutorial_image_2", title: "Get Started", description: "Swipe through this tutorial to get started."),
        TutorialPage(image: "tutorial_image_2", title: "Combo", description: "Swipe through this tutorial to get started."),
        TutorialPage(image: "tutorial_image_3", title: "Enjoy!", description: "You're now ready to use MyApp.")
    ]

    var body: some View {
        TabView {
            ForEach(tutorialPages, id: \.title) { page in
                page
                    .padding()
                    .tag(page.title)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
