import SwiftUI

struct CardFlipView: View {
    @State private var flipped = false
     @State private var animate3d = false

     var body: some View {

           return VStack {
                 Spacer()

                 ZStack() {
                       FrontCard().opacity(flipped ? 0.0 : 1.0)
                       BackCard().opacity(flipped ? 1.0 : 0.0)
                 }
                 .modifier(FlipEffect(flipped: $flipped, angle: animate3d ? 180 : 0, axis: (x: 0, y: 1)))
                 .onTapGesture {
                       withAnimation(Animation.linear(duration: 0.8)) {
                             self.animate3d.toggle()
                       }
                 }
                 Spacer()
           }
     }
}


struct FrontCard : View {
      var body: some View {
            Text("One thing is for sure – a sheep is not a creature of the air.").padding(5).frame(width: 250, height: 150, alignment: .center).background(Color.yellow)
      }
}

struct BackCard : View {
      var body: some View {
            Text("If you know you have an unpleasant nature and dislike people, this is no obstacle to work.").padding(5).frame(width: 250, height: 150).background(Color.green)
      }
}


struct CardFlipApp_Previews: PreviewProvider {
    static var previews: some View {
        CardFlipView()
    }
}
