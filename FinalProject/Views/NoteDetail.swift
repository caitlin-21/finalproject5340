//
//  NoteDetail.swift
//  FinalProject
//
//  Created by Caitlin Johnson on 4/23/23.
//

import SwiftUI

struct NoteDetail: View {
    @Binding var note : NoteModel
    @StateObject var noteApp = NoteViewModel()
    var body: some View {
        VStack (alignment: .leading){
            TextField("Note Title", text: $note.title)
                .font(.system(size: 25))
                .fontWeight(.bold)
            TextEditor(text: $note.noteData)
                .font(.system(size: 20))
        }
        .padding()
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    noteApp.saveData(note: note)
                    note.title = ""
                    note.noteData = ""
                } label: {
                    Text("Save")
                }

            }
        }
    }
}

struct NoteDetail_Previews: PreviewProvider {
    static var previews: some View {
        NoteDetail(note: .constant(NoteModel(title: "Placeholder", noteData: "ViewPreview")))
    }
}
