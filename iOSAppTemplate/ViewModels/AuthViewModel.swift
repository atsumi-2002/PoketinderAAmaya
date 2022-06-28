//
//  AuthViewModel.swift
//  iOSAppTemplate
//
//  Created by MAC34 on 20/06/22.
//

import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject {
    
    @StateObject var appState: AppState = .shared
    @Published var showError: Bool = false
    @Published var errorMessage: String = ""

    func login(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { authResponse, error in
            if error == nil {
                self.appState.currentScreen = .main
            }else{
                self.showError = true
                self.errorMessage = error!.localizedDescription
                return
            }
        }
    }
    func register(name: String, email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResponse, error in
            if error == nil {
                let changeRequest = Auth.auth().currentUser?.createProfileChangeRequest()
                changeRequest?.displayName = name
                changeRequest?.commitChanges()
                self.appState.currentScreen = .main
            }else{
                self.showError = true
                self.errorMessage = error!.localizedDescription
                return
            }
        }
    }
}
