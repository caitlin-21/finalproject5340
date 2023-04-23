//
//  SignIn.swift
//  FinalProject
//
//  Created by Sherry Johnson on 4/22/23.
//

import SwiftUI
import FirebaseAuth


    struct SignIn: View {
        @State private var email = ""
        @State private var password = ""
        @State var showView = false
        
        var body: some View {
            NavigationView {
                VStack() {
                    Text("Rick and Morty Notes")
                        .font(.largeTitle).foregroundColor(Color.white)
                        .padding([.top, .bottom], 40)
                    
                    Image("iosapptemplate")
                        .resizable()
                        .frame(width: 250, height: 250)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
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
                    Button(action: {
                        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                            print("*** Login in progress... ***")
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                self.showView = true
                            }                    }}) {
                                Text("Sign Up")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(width: 300, height: 50)
                                    .background(Color.cyan)
                                    .cornerRadius(15.0)
                            }
                    Button(action: {
                        print("*** Login in progress... ***")
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            self.showView = true
                        }
                    }) {
                        Text("Log In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.cyan)
                            .cornerRadius(15.0)
                    }
                    Spacer()
                    NavigationLink(destination: CharacterView(), isActive: $showView) {
                        EmptyView()
                    }
                }
                .background(
                    LinearGradient(gradient: Gradient(colors: [.purple, .blue]), startPoint: .topLeading, endPoint: .bottomTrailing)
                        .edgesIgnoringSafeArea(.all))
            }
        }
    }
    
    struct SignIn_Previews: PreviewProvider {
        static var previews: some View {
            SignIn()
        }
    }
