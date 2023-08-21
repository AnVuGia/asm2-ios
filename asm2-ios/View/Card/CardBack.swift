//
//  CardBack.swift
//  asm2-ios
//
//  Created by An Vu Gia on 21/08/2023.
//

import SwiftUI

struct CardBack: View {
    var body: some View {
        Image("card-back")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 70)
    }
}

struct CardBack_Previews: PreviewProvider {
    static var previews: some View {
        CardBack()
    }
}
