//
//  NoteView.swift
//  FinalProject
//
//  Created by Caitlin Johnson on 4/23/23.
//

import SwiftUI

struct NoteView: View {
    @StateObject var noteApp = NoteViewModel()
    @State var note = NoteModel(title: "", noteData: "")
    var body: some View {
        NavigationStack {
            List {
                ForEach($noteApp.notes) { $note in
                    NavigationLink {
                        NoteDetail(note: $note)
                    }
                label: {
                    Text(note.title)
                }
                }
                Section {
                    NavigationLink {
                        NoteDetail(note: $note)
                    }
                label: {
                    Text("New note")
                        .foregroundColor(Color.gray)
                        .font(.system(size: 15))
                }
                }
            }
            .onAppear {
                noteApp.fetchData()
            }
            .refreshable {
                noteApp.fetchData()
            }

        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
