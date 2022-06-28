//
//  SignInView.swift
//  iOSAppTemplate
//
//  Created by MAC34 on 18/06/22.
//

import SwiftUI

struct SignInView: View {
    
    @StateObject var authViewModel = AuthViewModel()
    @EnvironmentObject var appState: AppState
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State var alertError = true
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Text("Hello Again")
                        .font(.system(size: 25, weight: .bold))
                    Text("Welcome bavk yo've missed")
                        .font(.system(size: 20))
                        .frame(maxWidth: 200)
                    VStack(spacing: 25) {
                        TextField("Emter you email", text: $email)                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.pink, lineWidth: 1))
                            .keyboardType(.emailAddress)
                        SecureField("Emter you password", text: $password)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(.pink, lineWidth: 1))
                        Button {
                            authViewModel.login(email: email, password: password)
                        } label: {
                            Text("Sign In")
                                .padding()
                                .foregroundColor(.white)
                                .font(.system(size: 18, weight: .bold))
                        }
                        .frame(maxWidth: .infinity)
                        .background(.pink)
                        .cornerRadius(8)
                        
                        NavigationLink(destination: SignUpView()) {
                            Text("Not a member? Register now")
                        }
                    }
                    .padding()
                    .alert(isPresented: $alertError){
                        Alert(title: Text("Error"),message: Text(authViewModel.errorMessage), dismissButton: .default(Text("Oh")))
                    }
                    .onReceive(authViewModel.$showError){
                        newvalue in alertError = newvalue
                    }
                }
            }
        }.accentColor(.pink)
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
