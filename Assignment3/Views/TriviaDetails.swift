//
//  TriviaDetails.swift
//  Assignment3
//
//  Created by Sherry Johnson on 3/23/23.
//

import SwiftUI

struct TriviaDetails: View {
    var body: some View {
        VStack {
            Text("Trivia Question")
                .font(.system(size: 20))
            AnswersView()
        }
    }
}

struct TriviaDetails_Previews: PreviewProvider {
    static var previews: some View {
        TriviaDetails()
    }
}
