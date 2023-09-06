/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Vu Gia An
  ID: s3926888
  Created  date: 25/08/2023
  Last modified: 6/09/2023
  Acknowledgement: Acknowledge the resources that you use here.
*/

import Foundation
import SwiftUI
struct PokeCard : Decodable, Identifiable {
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
            return [Color.orange , Color.white, Color.orange , Color.red]
        } else if type == "Water" {
            return [Color.blue, Color.white,Color.blue, Color.blue ]
        } else if type == "Grass" {
            return [Color.green, Color.white, Color.green, Color.green]
        }
        else {
            return [Color.yellow, Color.white, Color.yellow, Color.yellow]
            
        }
    }
}
