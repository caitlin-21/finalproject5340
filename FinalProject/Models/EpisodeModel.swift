//
//  EpisodeModel.swift
//  FinalProject
//
//  Created by Caitlin Johnson on 4/25/23.
//

import Foundation

struct EpisodeModel : Codable, Identifiable {
    var id : Int
    let name : String
    let air_date : String
    let episode : String
    let characters : [String]
    let url : String
    let created : String
    
}
