//
//  AppDelegate.swift
//  RickAndMortyUiKit
//
//  Created by Mario Saldana on 17/02/25.
//

import Foundation
import UIKit
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}
