//
//  TriviaDetails.swift
//  Assignment3
//
//  Created by Sherry Johnson on 3/23/23.
//

import SwiftUI

struct CharacterDetails: View {
    var data : CharacterModel
    var body: some View {
        VStack {
            CharacterImageView(url: data.image)
            Text("Details for \(data.name)")
                .font(.system(size: 20))
            Text("Status: \(data.status)")
            Text("Species: \(data.species)")
            
        }
        
    }
}

struct TriviaDetails_Previews: PreviewProvider {
    static var previews: some View {
        CharacterDetails(data: CharacterModel(id: 0, name: "Rick Sanchez", status: "Alive", species: "Human", gender: "Male", image: ""))
    }
}
