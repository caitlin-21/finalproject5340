//
//  EpisodeDetailView.swift
//  FinalProject
//
//  Created by Caitlin Johnson on 4/25/23.
//

import SwiftUI

struct EpisodeDetailView: View {
    @ObservedObject var episodeVM = EpisodeViewModel()
    var episode : String
    var body: some View {
            List {
                ForEach(episodeVM.episodeData) { episode in
                    HStack {
                        Text("Episode Title:")
                        Spacer()
                        Text(episode.name)
                    }
                    HStack {
                        Text("Original Air Date:")
                        Spacer()
                        Text(episode.air_date)
                    }
                    HStack {
                        Text("Number of Characters Present:")
                        Spacer()
                        Text("\(episode.characters.count)")
                    }
                }
                
            }
            .onAppear {
                episodeVM.fetchData(url: episode)
                
            }
            .listStyle(.grouped)
            
        }
    }


struct EpisodeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeDetailView(episode: "https://rickandmortyapi.com/api/episode/1")
    }
}
