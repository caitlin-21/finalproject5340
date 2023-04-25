//
//  EpisodeView.swift
//  FinalProject
//
//  Created by Caitlin Johnson on 4/25/23.
//

import SwiftUI

struct EpisodeView: View {
    var episodes : [String]
    @ObservedObject var episodeVM = EpisodeViewModel()
    var body: some View {
        VStack {
            NavigationStack {
                List {
                    ForEach(episodes, id: \.self) { episode in
                            NavigationLink {
                                EpisodeDetailView(episode: episode)
                            } label: {
                                let substrings = episode.split(separator: "/")
                                Text("Episode " + String(substrings[substrings.endIndex-1]))
                            }
                    }
                }
            }
        }
    }
}

struct EpisodeView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeView(episodes: ["episode/1", "episode/2"])
    }
}
