//
//  MButton.swift
//  Delicious
//
//  Created by Anonymos on 19/07/2021.
//

import SwiftUI

struct MButton: View {
  var image: String
  var color: Color = .white
  var width: CGFloat = 60
  var height: CGFloat = 60
  
  var action: (() -> ())?
  
  var body: some View {
    Button(action: {
      action?()
    }, label: {
      Image(image)
        .renderingMode(.template)
        .foregroundColor(color)
        .frame(width: width, height: height)
    })
  }
}
