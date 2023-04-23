//
//  NoteModel.swift
//  FinalProject
//
//  Created by Caitlin Johnson on 4/23/23.
//

import Foundation
import FirebaseFirestoreSwift

struct NoteModel : Codable, Identifiable {
    @DocumentID var id : String?
    var title : String
    var noteData : String
}
