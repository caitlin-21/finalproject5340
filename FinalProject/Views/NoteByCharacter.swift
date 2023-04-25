//
//  NoteByCharacter.swift
//  FinalProject
//
//  Created by Caitlin Johnson on 4/24/23.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct NoteByCharacter: View {
    @ObservedObject var charactervm = CharacterViewModel()
    @StateObject var noteApp = NoteViewModel()
    @StateObject var noteAppCheck = NoteViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(charactervm.characterData) { character in
                   
                        NavigationLink {
                            CharacterNoteView(character: character.name)
                        } label: {
                            Text(character.name)
                        }
                    }
                }
                
            }
            .onAppear {
                charactervm.fetchData()
                noteApp.fetchData()
            }
            .listStyle(.grouped)
            .navigationTitle("Notes by Character")
            
        }
    }

struct NoteByCharacter_Previews: PreviewProvider {
    static var previews: some View {
        NoteByCharacter()
    }
}
