//
//  RegisterEmailView.swift
//  RickAndMortyUiKit
//
//  Created by Mario Saldana on 18/02/25.
//

import SwiftUI

struct RegisterEmailView: View {
    @State private var textFieldEmail = ""
    @State private var textFieldPassword = ""
    @ObservedObject var authenticationViewModel: AuthenticationViewModel

    var body: some View {
        ZStack {
            Color.mint.opacity(0.2)
                .edgesIgnoringSafeArea(.all)
            VStack {
                DismissView()
                
                Group {
                    Text("Bienvenido a")
                    Text("Rick and Morty app")
                        .bold()
                        .underline()
                }
                .padding(.horizontal, 8)
                .multilineTextAlignment(.center)
                .font(.largeTitle)
                .tint(.primary)

                Group {
                    Text("Loguéate de nuevo para poder acceder a la app")
                        .tint(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.top, 2)
                        .padding(.bottom, 32)
                    TextField("Email", text: $textFieldEmail)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.none)
                        .padding(8)
                        .font(.headline)
                        .background(.gray.opacity(0.3))
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.mint, lineWidth: 3)
                        )
                        .padding(.horizontal)

                    SecureField("Contraseña", text: $textFieldPassword)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.none)
                        .padding(8)
                        .font(.headline)
                        .background(.gray.opacity(0.3))
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                        .overlay(
                            RoundedRectangle(cornerRadius: 6)
                                .stroke(.mint, lineWidth: 3)
                        )
                        .padding(.vertical)
                        .padding(.horizontal)
                    Button {
                        authenticationViewModel.createNewUser(email: textFieldEmail, password: textFieldPassword)
                    } label: {
                        Label("Aceptar", systemImage: "arrow.right.circle")
                            .padding(.horizontal, 10)
                            .padding(.vertical, 2)
                    }
                    .padding(.top, 18)
                    .buttonStyle(.bordered)
                    .tint(.blue)
                    if let messageError = authenticationViewModel.messageError {
                        Text(messageError)
                            .bold()
                            .font(.body)
                            .foregroundColor(.red)
                            .padding(.top, 20)
                    }

                }.padding(.horizontal, 30)
            }
        }
    }
}

#Preview {
    RegisterEmailView(authenticationViewModel: AuthenticationViewModel())
}
