//
//  PokeCard.swift
//  asm2-ios
//
//  Created by An Vu Gia on 21/08/2023.
//

import Foundation

class PokeCard {
    var id : String
     var name : String
    var type : String
     var imgName : String
    init(name: String, type: String, imgName: String, id: String) {
        self.name = name
        self.type = type
        self.imgName = imgName
        self.id = id
    }
}
