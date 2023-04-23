//
//  CharacterDetails.swift
//  FinalProject
//
//  Created by Caitlin Johnson on 3/23/23.
//

import SwiftUI

struct CharacterDetails: View {
    var data : CharacterModel
    @State var note = NoteModel(title: "", noteData: "")
    var body: some View {
        VStack {
            Text("Details for \(data.name)")
                .font(.system(size: 28))
                .fontWeight(.bold)
                .foregroundColor(Color.black)
                
                
            CharacterImageView(url: data.image)
            List {
                Text("Status: \(data.status)")
                Text("Species: \(data.species)")
                Text("Gender: \(data.gender)")
                Text("Appearances: \(data.episode.count)")
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
            } .font(.system(size: 24))
            
        }
        
    }
}

struct TriviaDetails_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetails(data: CharacterModel(id: 0, name: "Rick Sanchez", status: "Alive", species: "Human", gender: "Male", image: "", episode: ["17"]))
    }
}
