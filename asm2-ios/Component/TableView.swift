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
    @State private var clickCount : Int
    @State private var playerCurrentCards : [[Int]]
    @State private var discardCard : [Int] = []
    init() {
        _isClicks = State(initialValue: Array(repeating: Array(repeating: false, count: 5), count: 4))
        _cards = State(initialValue: Array(repeating: Array(repeating: 0, count: 5), count: 4))
        _clickCount = State(initialValue: 0)
        _playerCurrentCards  = State(initialValue: Array(repeating: Array(repeating: -1, count: 2), count: 2))
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
                            Button {
                                onFlipCard(row: row, column: column)
                            } label: {
                                if isClicks[row][column] && discardCard.contains(cards[row][column]) {
                                           EmtyView()
                                        } else {
                                            CardBack(pokeCard: pokemonData[index], isClick: $isClicks[row][column])
                                        }                            }
                                                } else {
                                                    Text("Invalid Index")
                                                }
                                                                        
                    }
                }
            }
        }.onAppear {
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
    func onFlipCard(row: Int, column: Int) {
        print("\(row) , \(column)")
        
        // Check if the selected card is already flipped or if clickCount exceeds 2
        if isClicks[row][column] || clickCount >= 2 {
            print("Return")
            return
        }
        
        print("Flip")
        
        // Toggle the card's state
        isClicks[row][column].toggle()
        
        // Store the selected card's position
        playerCurrentCards[clickCount] = [row, column]
        clickCount += 1
        
        if clickCount == 2 {
            // Set timeout
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                // Check matching cards
                if self.checkSameCard() {
                    print("\(true)")
                    discardCard.append(cards[row][column])
                } else {
                    // Cards don't match, flip them back
                    for index in 0..<2 {
                        let temp = playerCurrentCards[index]
                        let tempRow = temp[0]
                        let tempColumn = temp[1]
                        isClicks[tempRow][tempColumn].toggle()
                    }
                }
                
                // Reset the click count
                clickCount = 0
            }
        }
    }


    func checkSameCard() -> Bool {
        let card1 = playerCurrentCards[0]
        let card2 = playerCurrentCards[1]
        
        // Check if the two selected cards match based on their positions
        if(card1[0] > -1 && card2[0] > -1) {
            print("card1: \(card1[0]) \(card1[1])")
            print("card2: \(card2[0]) \(card2[1])")
            return cards[card1[0]][card1[1]] == cards[card2[0]][card2[1]]
        } else  {
            return false

        }
    }
}
//



struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        TableView()
    }
}
