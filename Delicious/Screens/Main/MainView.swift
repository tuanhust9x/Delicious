//
//  MainView.swift
//  Delicious
//
//  Created by Anonymos on 16/07/2021.
//

import SwiftUI

struct MainView: View {
  var body: some View {
    VStack {
      Spacer()
      TabbarView()
    }
    .background(Color.init(#colorLiteral(red: 0.8196078431, green: 0.8270888329, blue: 0.8519172668, alpha: 1)))
    .edgesIgnoringSafeArea(.bottom)
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      MainView()
        .previewDevice("iPhone 11")
    }
  }
}

