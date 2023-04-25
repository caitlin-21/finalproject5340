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
                                Text("Episode \(episode)")
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
