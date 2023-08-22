import SwiftUI

struct TableView: View {
    @ObservedObject var tableModel: TableModel
    init(tableModel: TableModel) {
        self.tableModel = tableModel
    }
    var body: some View {
        VStack {
            ForEach(0..<4) { rowIndex in
                HStack {
                    ForEach(0..<5) { columnIndex in
                        if tableModel.checkDone(row: rowIndex, column: columnIndex) {
                            EmtyView()
                        } else {
                            Button {
                                tableModel.onFlipCard(row: rowIndex, column: columnIndex)
                            } label: {
                                let index = tableModel.cards[rowIndex][columnIndex]
                                let isClickTemp = Binding(
                                    get: { tableModel.isClicks[rowIndex][columnIndex] },
                                    set: { newValue in
                                        tableModel.isClicks[rowIndex][columnIndex] = newValue
                                    }
                                )
                                CardBack(pokeCard: pokemonData[index], isClick: isClickTemp)
                            }
                        }
                    }
                }
            }
        }
    }
}


struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        
        TableView(tableModel:  TableModel())
    }
}
