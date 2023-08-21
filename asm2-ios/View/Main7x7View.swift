//
//  Main7x7View.swift
//  asm2-ios
//
//  Created by An Vu Gia on 21/08/2023.
//

import SwiftUI

struct Main7x7View: View {
    private var column = 7
    private var row = 7
    var body: some View {
        ZStack {
            Image("background7x7")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        }
    }
}

struct Main7x7View_Previews: PreviewProvider {
    static var previews: some View {
        Main7x7View()
    }
}
	
