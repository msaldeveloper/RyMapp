//
//  RickAndMortyUiKitApp.swift
//  RickAndMortyUiKit
//
//  Created by Mario Saldana on 17/02/25.
//



import SwiftUI
import FirebaseCore

@main
struct RickAndMortyUiKitApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            SplashScreen()
        }
    }
}
