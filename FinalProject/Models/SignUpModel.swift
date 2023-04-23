//
//  SignUpModel.swift
//  FinalProject
//
//  Created by Caitlin Johnson on 4/22/23.
//

import Foundation
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
class SignUpModel {
    func SignUp(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let strongSelf = self else { return }
            // ...
        }
    }
}
