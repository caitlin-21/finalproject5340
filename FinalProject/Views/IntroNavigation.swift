//
//  IntroNavigation.swift
//  FinalProject
//
//  Created by Caitlin Johnson on 4/24/23.
//

import SwiftUI
import Firebase

struct IntroNavigation: View {
    @State private var userSignsOut = false
    
    var body: some View {
            if userSignsOut {
                SignIn()
            } else {
                content
            }
        }
    
    var content: some View {
        VStack {
            NavigationStack {
                List {
                    NavigationLink {
                        CharacterView()
                    }
                label: {
                    Text("Character List")
                }
                    Section {
                        NavigationLink {
                            NoteByCharacter()
                        } label: {
                            Text("Notes by Character")
                        }
                    }
                    Section {
                        NavigationLink {
                            NoteView()
                        } label: {
                            Text("All Notes")
                        }
                    }
                }
                
            }
            .listStyle(.grouped)
            .navigationTitle("Functions")
            Section {
                Button {
                    signOut()
                } label: {
                    Text("Log Out")
                }
            }
        }
    }
    func signOut() {
        do {
            try Auth.auth().signOut()
            userSignsOut = true
        } catch {
            print(error)
        }
        }
    }

struct IntroNavigation_Previews: PreviewProvider {
    static var previews: some View {
        IntroNavigation()
    }
}
