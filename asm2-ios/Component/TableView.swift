import SwiftUI

struct TableView: View {

    @ObservedObject var tableModel : TableModel
    var body: some View {
        VStack {
            ForEach(0..<tableModel.row) {rowIndex in
                HStack{
                    ForEach(0..<tableModel.column){ columnIndex in
                        if(tableModel.checkDone(row: rowIndex, column: columnIndex)){
                            EmtyView()
                        } else {
                            Button {
                                tableModel.onFlipCard(row: rowIndex, column: columnIndex)
                            } label: {
                                let index = tableModel.cards[rowIndex][columnIndex]
                                @State var isClickTemp = tableModel.isClicks[rowIndex][columnIndex]
                                CardBack(pokeCard: pokemonData[index], isClick: $isClickTemp)
                            }

                        }
                        
                    }
                }
            }
            }.onAppear {
            tableModel.createTableData(row: 4, column: 5)
        }
    }
}

struct TableView_Previews: PreviewProvider {
    static var previews: some View {
        
        TableView(tableModel:  TableModel())
    }
}
