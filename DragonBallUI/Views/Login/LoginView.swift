//
//  LoginView.swift
//  DragonBallUI
//
//  Created by Francisco Javier Alarza Sanchez on 6/10/22.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var rootViewModel: RootViewModel
    
    @State private var email = ""
    @State private var password = ""
    @State private var animationAmounth = 1.0
    
    var body: some View {
        ZStack {
            Image(decorative: "backgroundLogin")
                .resizable()
                .opacity(1)
            Image(decorative: "")
                .resizable()
                .background(.black)
                .opacity(0.5)
            
            VStack {
                Image(decorative: "title")
                    .resizable()
                    .scaledToFit()
                    .padding()
                TextField("Email", text: $email)
                    .padding()
                    .background(.white)
                    .foregroundColor(.blue)
                    .cornerRadius(20)
                    .shadow(radius: 10, x: 20, y: 10)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                    .opacity(0.8)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(.white)
                    .foregroundColor(.blue)
                    .cornerRadius(20)
                    .shadow(radius: 10, x: 20, y: 10)
                    .textInputAutocapitalization(.never)
                    .autocorrectionDisabled(true)
                    .opacity(0.8)
                    .padding(.top, 20)
                
                Button {
                    rootViewModel.login(user: email, password: password)
                    UserDefaults.standard.set(email, forKey: "user")
                } label: {
                    Text("Entrar")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 300, height: 50)
                        .background(Color(uiColor: UIColor(red: 221/255, green: 99/255, blue: 0, alpha: 0.8)))
                        .cornerRadius(20)
                        .shadow(radius: 10, x: 20, y: 10)
                }
                .padding(.top, 50)
                .overlay {
                    Circle()
                        .stroke(Color.white)
                        .scaleEffect(animationAmounth)
                        .opacity(2-animationAmounth)
                        .animation(.easeInOut(duration: 1).repeatForever(), value: animationAmounth)
                        .padding(.top, 50)
                }
                .onAppear {
                    animationAmounth = 2
                }
                Spacer()
                HStack {
                    Text("¿ No tienes cuenta? ")
                        .foregroundColor(.white)
                    Text("Regístrate")
                        .foregroundColor(.blue)
                }
                .padding()
                
            }
            .padding([.leading, .trailing], 20)
            .padding(.top, 250)
            
            
        }
        .ignoresSafeArea()
        
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            
            LoginView()
                .environment(\.locale, .init(identifier: "es"))
            LoginView()
                .environment(\.locale, .init(identifier: "en"))
        }
        
    }
}
