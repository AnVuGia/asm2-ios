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

struct CardBack: View {
    var pokeCard : PokeCard
    @Binding var isClick : Bool
    @State private var flipped = false
    var body: some View {
        VStack{
            ZStack{
                PokeCardView(pokeCard: pokeCard).opacity(flipped ? 1.0 : 0)
                ZStack {
                    Image("card-back")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 90)
                    Text("\(pokeCard.name)")
                        .foregroundColor(Color.black)
                        .background(Color.white)
                }.opacity(flipped ? 0 : 1.0)
            }.modifier(FlipEffect(flipped: $flipped, angle: isClick ? 180 : 0, axis: (x: 0, y: 1)))
        }
    }
}
struct FlipEffect: GeometryEffect {

      var animatableData: Double {
            get { angle }
            set { angle = newValue }
      }

      @Binding var flipped: Bool
      var angle: Double
      let axis: (x: CGFloat, y: CGFloat)

      func effectValue(size: CGSize) -> ProjectionTransform {

            DispatchQueue.main.async {
                  self.flipped = self.angle >= 90 && self.angle < 270
            }

            let tweakedAngle = flipped ? -180 + angle : angle
            let a = CGFloat(Angle(degrees: tweakedAngle).radians)

            var transform3d = CATransform3DIdentity;
            transform3d.m34 = -1/max(size.width, size.height)

            transform3d = CATransform3DRotate(transform3d, a, axis.x, axis.y, 0)
            transform3d = CATransform3DTranslate(transform3d, -size.width/2.0, -size.height/2.0, 0)

            let affineTransform = ProjectionTransform(CGAffineTransform(translationX: size.width/2.0, y: size.height / 2.0))

            return ProjectionTransform(transform3d).concatenating(affineTransform)
      }
}

struct CardBack_Previews: PreviewProvider {
    static var previews: some View {
        CardBack(pokeCard: PokeCard(name: "charizard", type: "Fire", imgName: "charizard", id: "1"), isClick: .constant(false))
    }
}
