//
//  ContentView.swift
//  RickAndMortyUiKit
//
//  Created by Mario Saldana on 17/02/25.
//

import SwiftUI

struct SplashScreen: View {
    @State private var logoScale: CGFloat = 0.1
    @State private var textOpacity: Double = 0
    @State private var showLogin: Bool = false
    
    var body: some View {
        if showLogin {
            LoginView()
        }else {
            ZStack {
                Color.blue.edgesIgnoringSafeArea(.all)
                VStack {
                    Image("rickAndMortyLogoSplash")
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: 300)
                        .font(.system(size: 100))
                        .foregroundColor(.white)
                        .shadow(color: .gray, radius: 10, x: 0, y: 5)
                        .scaleEffect(logoScale)
                        .opacity(textOpacity)

                    Text("Rick And Morty App")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .opacity(textOpacity)
                }.onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        showLogin = true
                    }
                    withAnimation(.easeInOut(duration: 1.5)) {
                        logoScale = 1.0
                    }
                    withAnimation(.easeIn(duration: 1.0).delay(0.5)) {
                        textOpacity = 1.0
                    }
                }
            }
        }
        
    }
}

#Preview {
    SplashScreen()
}
