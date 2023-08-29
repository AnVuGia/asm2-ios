//
//  CardBack.swift
//  asm2-ios
//
//  Created by An Vu Gia on 21/08/2023.
//

import SwiftUI

struct CardBack: View {
    var pokeCard : PokeCard
    @Binding var isClick : Bool
    @State private var tempClick = false
    @State private var animate3d = false
    var body: some View {
        VStack{
            if (isClick || tempClick){
                PokeCardView(pokeCard: pokeCard)
            }
            else{
                ZStack {
                    Image("card-back")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 70, height: 90)
                    Text("\(pokeCard.name)")
                        .foregroundColor(Color.black)
                        .background(Color.white)
                }
                .modifier(FlipEffect(flipped: $tempClick, angle: animate3d ? 180 : 0, axis: (x: 0, y: 1)))
                
            }
                        Button("Click") {
                            withAnimation(.easeInOut(duration: 0.5)) {
                                tempClick.toggle()
                            }
            }
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
