//
//  MainNormalView.swift
//  asm2-ios
//
//  Created by An Vu Gia on 21/08/2023.
//

import SwiftUI

struct MainNormalView: View {
    var body: some View {
        ZStack {
            Image("background7x7")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            TableView()
        }
    }
}

struct MainNormalView_Previews: PreviewProvider {
    static var previews: some View {
        MainNormalView()
    }
}
