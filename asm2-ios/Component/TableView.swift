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
    @ObservedObject var tableModel = TableModel()
    var body: some View {
        let rowCount = 0..<row
        let columnCount = 0..<column
        VStack {
            ForEach(rowCount, id: \.self) { row in
                HStack {
                    ForEach(columnCount, id: \.self) { column in
                        let index = tableModel.cards[row][column]
                        if index >= 0 && index < pokemonData.count {
                            Button {
                                tableModel.onFlipCard(row: row, column: column)
                            } label: {
                                if tableModel.isClicks[row][column] && tableModel.discardCard.contains(tableModel.cards[row][column]) {
                                    EmtyView()
                                } else {
                                    CardBack(pokeCard: pokemonData[index], isClick: tableModel.$isClicks[row][column])
                                }                            }
                        } else {
                            Text("Invalid Index")
                        }
                        
                    }
                }
            }
        }.onAppear {
        }
    }
    //
    
}
    
    struct TableView_Previews: PreviewProvider {
        static var previews: some View {
            TableView()
        }
    }

