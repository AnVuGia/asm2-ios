//
//  TableView.swift
//  asm2-ios
//
//  Created by An Vu Gia on 21/08/2023.
//

import SwiftUI

struct TableView: View {
    let row : Int
    let column : Int
    var body: some View {
        VStack {
            ForEach(0..<7) { row in
                HStack {
                    ForEach(0..<7) { column in
                        Text("\(row * 7 + column)")
                            .frame(width: 30, height: 30)
                            .border(Color.black, width: 1)
                    }
                }
            }
        }
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView(row: 7, column: 7)
    }
}
