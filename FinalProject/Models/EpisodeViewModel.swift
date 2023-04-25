//
//  EpisodeViewModel.swift
//  FinalProject
//
//  Created by Caitlin Johnson on 4/25/23.
//

import Foundation


class EpisodeViewModel : ObservableObject {
    @Published private(set) var episodeData = [EpisodeModel]()
    
    @MainActor
    func fetchData(url : String) {
            if let url = URL(string: url) {
                URLSession
                    .shared
                    .dataTask(with: url) { (data, response, error) in
                        if let error = error {
                            print(error)
                        } else {
                            if let data = data {
                                var results : EpisodeModel? = nil
                                do {
                                    results = try JSONDecoder().decode(EpisodeModel.self, from: data)
                                    self.episodeData = [results!]
                                } catch {
                                    print(error)
                                }
                                print(results!)
                            }
                        }
                    }.resume()
            }
        }
}
