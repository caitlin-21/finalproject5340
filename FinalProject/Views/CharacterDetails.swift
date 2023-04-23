//
//  TriviaDetails.swift
//  Assignment3
//
//  Created by Caitlin Johnson on 3/23/23.
//

import SwiftUI

struct CharacterDetails: View {
    var data : CharacterModel
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
            } .font(.system(size: 24))
            
        }
        
    }
}

struct TriviaDetails_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetails(data: CharacterModel(id: 0, name: "Rick Sanchez", status: "Alive", species: "Human", gender: "Male", image: "", episode: ["17"]))
    }
}
