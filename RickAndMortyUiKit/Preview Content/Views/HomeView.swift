//
//  HomeView.swift
//  RickAndMortyUiKit
//
//  Created by Mario Saldana on 18/02/25.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var authenticationViewModel : AuthenticationViewModel
    var body: some View {
        NavigationView {
                    VStack {
                        Text("Bienvenido \(authenticationViewModel.user?.email ?? "No user")")
                            .padding(.top, 32)
                        Spacer()
                    }
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationTitle("Home")
                    .toolbar {
                        Button("Logout") {
                            authenticationViewModel.logout()
                        }
                    }
                }
            }
    }


#Preview {
    HomeView(authenticationViewModel: AuthenticationViewModel())
}
