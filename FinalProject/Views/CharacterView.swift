//
// ContentView.swift : Assignment3
//
// Copyright © 2023 Auburn University.
// All Rights Reserved.


import SwiftUI

struct CharacterView: View {
    
    @ObservedObject var charactervm = CharacterViewModel()
    var pages = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24", "25", "26", "27", "28", "29", "30", "31", "32", "33", "34", "35", "36", "37", "38", "39", "40", "41", "42"]
    var body: some View {
        TabView {
            ForEach(pages, id: \.self) { page in
                NavigationStack {
                    List {
                        ForEach(charactervm.characterData) { character in
                            NavigationLink {
                                CharacterDetails(data: character)
                            } label: {
                                Text(character.name)
                            }
                        }
                    }
                    .refreshable {
                       await charactervm.fetchData(page: page)
                    }
                    .listStyle(.grouped)
                    .navigationTitle("Rick and Morty Chars")
                    
                }
                .task {
                    await charactervm.fetchData(page: page)
                }
                .tabItem {
                    Text("Page \(page)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView()
    }
}
