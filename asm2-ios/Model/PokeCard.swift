//
//  PokeCard.swift
//  asm2-ios
//
//  Created by An Vu Gia on 21/08/2023.
//

import Foundation
import SwiftUI
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
    func getColorSets() -> [Color] {
        if type == "Fire" {
            return [Color.orange , Color.white, Color.orange]
        } else if type == "Water" {
            return [Color.blue, Color.white,Color.blue ]
        } else if type == "Grass" {
            return [Color.green, Color.green, Color.green]
        }
        else {
            return [Color.yellow, Color.white, Color.yellow]
            
        }
    }
}
