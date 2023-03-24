//
//  InfoModel.swift
//  Assignment3
//
//  Created by Caitlin Johnson on 3/24/23.
//

import Foundation

struct InfoModel : Codable {
    let count : Int
    let pages : Int
    let next : String
    let prev : String?
}
