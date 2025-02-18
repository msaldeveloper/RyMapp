//
//  AuthenticationView.swift
//  RickAndMortyUiKit
//
//  Created by Mario Saldana on 18/02/25.
//

import SwiftUI

enum AuthenticationSheetView: String, Identifiable {
    case register
    case login

    var id: String {
        return rawValue
    }
}

struct AuthenticationView: View {
    @State var authenticationSheetView: AuthenticationSheetView?
    @ObservedObject var authenticationViewModel: AuthenticationViewModel

    var body: some View {
        ZStack{
            Color.mint.opacity(0.2)
                .ignoresSafeArea(.all)
            VStack {
                Image("rickAndMortyLogoSplash")
                    .resizable()
                    .frame(width: 200, height: 200)
                    .shadow(color: .white, radius: 10, x: 0, y: 10)
                VStack {
                    Button {
                        authenticationSheetView = .login
                    } label: {
                        Label("Entra con Email", systemImage: "envelope.fill")
                            .foregroundStyle(Color.black)
                            .font(.title)
                            
                    }
                    .background(Color.green).clipShape(RoundedRectangle(cornerRadius: 5))
                    .buttonStyle(.bordered)
                    .padding(.top, 60)
                    .shadow(color: .white, radius: 50, x: 0, y: 10)
                    Spacer()
                    HStack {
                        Text("¿No tienes una cuenta?")
                        Button {
                            authenticationSheetView = .register
                        } label: {
                            Text("Regístrate")
                                
                        }
                        .sheet(item: $authenticationSheetView) { sheet in
                            switch sheet {
                            case .register:
                                RegisterEmailView(authenticationViewModel: authenticationViewModel)
                            case .login:
                                LoginView(authenticationViewModel: authenticationViewModel)
                            }
                        }
                    }
                }
            }
        }
        
        
    }
}

#Preview {
    AuthenticationView(authenticationViewModel: AuthenticationViewModel())
}
