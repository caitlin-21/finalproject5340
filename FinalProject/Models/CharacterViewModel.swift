//
//  CharacterViewModel.swift
//  FinalProject
//
//  Created by Caitlin Johnson on 3/23/23.
//

import Foundation


class CharacterViewModel : ObservableObject {
    
    @Published private(set) var characterData = [CharacterModel]()
    private let url = "https://rickandmortyapi.com/api/character"
    
    func fetchData() {
        if let url = URL(string: url) {
            URLSession
                .shared
                .dataTask(with: url) { (data, response, error) in
                    if let error = error {
                        print(error)
                    } else {
                        if let data = data {
                            var results : CharacterResults? = nil
                            do {
                                results = try JSONDecoder().decode(CharacterResults.self, from: data)
                                self.characterData = results!.results
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
