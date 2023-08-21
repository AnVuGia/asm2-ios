//
//  TableView.swift
//  asm2-ios
//
//  Created by An Vu Gia on 21/08/2023.
//

import SwiftUI

struct TableView: View {
    let row = 4
    let column = 5
    @State private var cards : [[Int]] = []
    var body: some View {
        let rowCount = 0..<row
        let columnCount = 0..<column
        VStack {
            ForEach(rowCount, id: \.self) { row in
                HStack {
                    ForEach(columnCount, id: \.self) { column in
                        CardBack()
                                                    
                    }
                }
            }
        }
    }
    func createTableData() -> Void {
        for _ in 0..<row {
            var rowArray: [Int] = []
            for _ in 0..<column {
                rowArray.append(0)
            }
            cards.append(rowArray)
        }
        
    }
}

    

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}
