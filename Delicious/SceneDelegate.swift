//
//  SceneDelegate.swift
//  Delicious
//
//  Created by Anonymos on 16/07/2021.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  
  var window: UIWindow?
  
  
  func scene(_ scene: UIScene,
             willConnectTo session: UISceneSession,
             options connectionOptions: UIScene.ConnectionOptions) {
    // Create the SwiftUI view that provides the window contents.
    let contentView = MainView()
      .background(Color.init(#colorLiteral(red: 0.8196078431, green: 0.8270888329, blue: 0.8519172668, alpha: 1)))
      .edgesIgnoringSafeArea(.all)
    
    // Use a UIHostingController as window root view controller.
    if let windowScene = scene as? UIWindowScene {
      let window = UIWindow(windowScene: windowScene)
      window.rootViewController = UIHostingController(rootView: contentView)
      self.window = window
      window.makeKeyAndVisible()
    }
  }
}

