//
//  LocationView.swift
//  Delicious
//
//  Created by Anonymos on 19/07/2021.
//

import SwiftUI

struct LocationView: View {
  var action: (() -> ())?
  
  var body: some View {
    HStack {
      Image("ic_location")
      Text("Ha Noi, Viet nam")
      Spacer()
      ZStack {
        MButton(image: "ic_search", action: action)
      }
    }
    .padding(EdgeInsets(top: 0, leading: 15, bottom: 0, trailing: 10))
    .frame(height: 60)
    .background(Color(#colorLiteral(red: 0.8196078431, green: 0.8270888329, blue: 0.8519172668, alpha: 1)))
  }
}

struct LocationView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      LocationView()
        .previewDevice("iPhone 11")
    }
  }
}

