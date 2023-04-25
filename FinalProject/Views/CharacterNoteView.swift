//
//  CharacterNoteView.swift
//  FinalProject
//
//  Created by Caitlin Johnson on 4/24/23.
//

import SwiftUI

struct CharacterNoteView: View {
    @State var character : String
    @StateObject var noteApp = NoteViewModel()
    @State var note = NoteModel(title: "", noteData: "", character: "")
    var body: some View {
        NavigationStack {
            List {
                ForEach($noteApp.notes) { $note in
                    NavigationLink {
                        NoteDetail(note: $note, character: note.character)
                    }
                label: {
                    Text(note.title)
                }
                }
                
            }
            .onAppear {
                noteApp.fetchData(character: character)
            }
            .refreshable {
                noteApp.fetchData(character: character)
            }

        }
    }
}

struct CharacterNoteView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterNoteView(character: "Rick Sanchez")
    }
}
