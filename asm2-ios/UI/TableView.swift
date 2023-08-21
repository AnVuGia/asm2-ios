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
    @State private var cards : [[Int]]
    @State private var isClicks : [[Bool]]
    init() {
        _isClicks = State(initialValue: Array(repeating: Array(repeating: false, count: 5), count: 4))
        _cards = State(initialValue: Array(repeating: Array(repeating: 0, count: 5), count: 4))
        }
    var body: some View {
        let rowCount = 0..<row
        let columnCount = 0..<column
        VStack {
            ForEach(rowCount, id: \.self) { row in
                HStack {
                    ForEach(columnCount, id: \.self) { column in
                        let index = cards[row][column]
                        if index >= 0 && index < pokemonData.count {
                                                    CardBack(pokeCard: pokemonData[index], isClick: $isClicks[row][column])
                                                        .onTapGesture {
                                                            isClicks[row][column].toggle()
                                                        }
                                                } else {
                                                    Text("Invalid Index")
                                                }
                                                                        
                    }
                }
            }
            Button("Start Game") {
                var array : [Int] = [0,0,1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9]
                for rowNo in 0..<row {
                    for colNo in 0..<column{
                        let randomNumber = Int.random(in: 0..<array.count)
                        cards[rowNo][colNo] = array[randomNumber]
                        array.remove(at: randomNumber)
                        
                    }
                }
            }
        }
    }
}
//
//@State private var array : [String] = ["1","1","2","2","3","3","4","4","5","5","6","6","7","7","8","8","9","9","10","10"]


struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}
