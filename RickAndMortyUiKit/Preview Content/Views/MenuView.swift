//
//  MenuView.swift
//  RickAndMortyUiKit
//
//  Created by Mario Saldana on 18/02/25.
//

import SwiftUI

struct MenuView: View {
    @ObservedObject var authenticationViewModel: AuthenticationViewModel
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView(authenticationViewModel: authenticationViewModel)
            }
        }
        
    }
}

#Preview {
    MenuView(authenticationViewModel: AuthenticationViewModel())
}
