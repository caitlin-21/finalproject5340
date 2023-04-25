//
//  CharacterViewModel.swift
//  Assignment3
//
//  Created by Caitlin Johnson on 3/23/23.
//

import Foundation


class CharacterViewModel : ObservableObject {
    
    @Published private(set) var characterData = [CharacterModel]()
    
    func fetchData() {
        let url = "https://rickandmortyapi.com/api/character"
        if let urltwo = URL(string: url) {
            URLSession
                .shared
                .dataTask(with: urltwo) { (data, response, error) in
                    if let error = error {
                        print(error)
                    } else {
                        if let data = data {
                            var results : CharacterResults? = nil
                            do {
                                results = try JSONDecoder().decode(CharacterResults.self, from: data)
                                DispatchQueue.main.async {
                                    self.characterData = results!.results
                                }
                            } catch {
                                print(error)
                            }
                            print(results!)
                        }
                    }
                }.resume()
        }
    }
    @MainActor
    func fetchData(page: String) async {
            let url = "https://rickandmortyapi.com/api/character?page=\(page)"
            if let urltwo = URL(string: url) {
                do {
                    let (data, _) = try await URLSession
                        .shared
                        .data(from: urltwo)
                    let results = try JSONDecoder().decode(CharacterResults.self, from: data)
                    self.characterData = results.results
                } catch {
                    print(error)
                }

            }
        }
}
