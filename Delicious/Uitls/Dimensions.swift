//
//  Dimensions.swift
//  Delicious
//
//  Created by Anonymos on 16/07/2021.
//

import UIKit

struct Dimensions {
  static var topArea: CGFloat {
    var topSafeArea: CGFloat = 0
    let scene = UIApplication.shared.connectedScenes.first
    if let sd : SceneDelegate = (scene?.delegate as? SceneDelegate) {
      topSafeArea = sd.window?.safeAreaInsets.top ?? 0
    }
    return topSafeArea
  }
  
  static var bottomArea: CGFloat {
    var bottomSafeArea: CGFloat = 0
    
    let scene = UIApplication.shared.connectedScenes.first
    if let sd : SceneDelegate = (scene?.delegate as? SceneDelegate) {
      bottomSafeArea = sd.window?.safeAreaInsets.bottom ?? 0
    }
    return bottomSafeArea
  }
  
  static var safeArea: CGFloat {
    return topArea + bottomArea
  }
  
  static var scrW: CGFloat {
    return UIScreen.main.bounds.width
  }
  
  static var scrH: CGFloat {
    return UIScreen.main.bounds.height
  }
}
