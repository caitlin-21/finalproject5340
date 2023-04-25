//
//  NoteViewModel.swift
//  FinalProject
//
//  Created by Caitlin Johnson on 4/23/23.
//

import Foundation
import FirebaseCore
import FirebaseFirestore

class NoteViewModel : ObservableObject {
    
    @Published var notes = [NoteModel]()
    let db = Firestore.firestore()
    
    func fetchData() {
        notes.removeAll()
        db.collection("Notes")
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        do {
                            self.notes.append(try document.data(as: NoteModel.self))
                        } catch {
                            print(error)
                        }
                    }
                }
        }
    }
    func fetchData(character : String) {
        notes.removeAll()
        db.collection("Notes").whereField("character", isEqualTo: character)
            .getDocuments() { (querySnapshot, err) in
                if let err = err {
                    print("Error getting documents: \(err)")
                } else {
                    for document in querySnapshot!.documents {
                        do {
                            self.notes.append(try document.data(as: NoteModel.self))
                        } catch {
                            print(error)
                        }
                    }
                }
        }
    }
    
    func saveData(note : NoteModel) {
        if let id = note.id {
            //Edit
            if !note.title.isEmpty || !note.noteData.isEmpty {
                let noteRef = db.collection("Notes").document(id)
                
                // Set title and NoteData
                noteRef.updateData([
                    "title": note.title,
                    "noteData": note.noteData,
                    "character": note.character
                ]) { err in
                    if let err = err {
                        print("Error updating document: \(err)")
                    } else {
                        print("Document successfully updated")
                    }
                }
            }
        } else {
            //Add
            if !note.title.isEmpty || !note.noteData.isEmpty {
                var ref: DocumentReference? = nil
                ref = db.collection("Notes").addDocument(data: [
                    "title": note.title,
                    "noteData": note.noteData,
                    "character": note.character
                ]) { err in
                    if let err = err {
                        print("Error adding document: \(err)")
                    } else {
                        print("Document added with ID: \(ref!.documentID)")
                    }
                }
            }
        }
    }
    
}
