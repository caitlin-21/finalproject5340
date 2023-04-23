//
//  CharacterModel.swift
//  FinalProject
//
//  Created by Caitlin Johnson on 3/23/23.
//

import Foundation

struct CharacterResults : Codable {
    let info : InfoModel
    let results : [CharacterModel]
}

struct CharacterModel : Codable, Identifiable {
    var id : Int
    let name : String
    let status : String
    let species : String
    let gender : String
    let image : String
    let episode : [String]
    
}

