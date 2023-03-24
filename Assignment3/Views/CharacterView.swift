//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct CharacterView: View {
    
    @ObservedObject var charactervm = CharacterViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(charactervm.characterData) { character in
                NavigationLink {
                    TriviaDetails()
                } label: {
                    Text(character.name)
                }
            }
            }
            .onAppear {
                charactervm.fetchData()
                
            }
            .listStyle(.grouped)
            .navigationTitle("Rick and Morty Chars")
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}
