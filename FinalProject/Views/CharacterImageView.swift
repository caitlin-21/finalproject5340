//
//  AnswersView.swift
//  Assignment3
//
//  Created by Caitlin Johnson on 3/23/23.
//

import SwiftUI

struct CharacterImageView: View {
    var url : String
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 200, height: 200)
    }
}

struct CharacterImageView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterImageView(url: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")
    }
}
