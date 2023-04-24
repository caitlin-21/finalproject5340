//
//  SignIn.swift
//  FinalProject
//
//  Created by Caitlin Johnson on 4/22/23.
//

import SwiftUI
import FirebaseAuth


    struct SignIn: View {
        @State private var email = ""
        @State private var password = ""
        @State private var userIsLoggedIn = false
        
        var body: some View {
            if userIsLoggedIn {
                IntroNavigation()
            } else {
                content
            }
        }
        
        var content: some View {
                    VStack() {
                        Text("Rick and Morty Notes")
                            .font(.largeTitle).foregroundColor(Color.white)
                            .padding([.top, .bottom], 40)
                        
                        Image("rickandmortylogo")
                            .resizable()
                            .frame(width: 250, height: 250)
                            .clipShape(Circle())
                            //.overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                            .padding(.bottom, 50)
                        VStack(alignment: .leading, spacing: 15) {
                            
                            TextField("Email", text: self.$email)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(20.0)
                            
                            SecureField("Password", text: self.$password)
                                .padding()
                                .background(Color.white)
                                .cornerRadius(20.0)
                        }.padding([.leading, .trailing], 27.5)
                        HStack (alignment: .top) {
                            Button {
                                register()
                            } label: {
                                Text("Sign Up")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 150, height: 50)
                                    .background(Color.cyan)
                                    .cornerRadius(15.0)
                            }
                            Button {
                                login()
                            } label: {
                                Text("Log In")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 150, height: 50)
                                    .background(Color.cyan)
                                    .cornerRadius(15.0)
                            }

                        }
                        .padding(.top)
                        Spacer()
                    }
                    .background(
                        LinearGradient(gradient: Gradient(colors: [.pink, .blue]), startPoint: .top, endPoint: .bottom)
                            .edgesIgnoringSafeArea(.all))
                
            }
        func login() {
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    userIsLoggedIn = true
                }
            }
        }
        func register() {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if error != nil {
                    print(error!.localizedDescription)
                } else {
                    userIsLoggedIn = true
                }
            }
        }
    }
    
    struct SignIn_Previews: PreviewProvider {
        static var previews: some View {
            SignIn()
        }
    }
