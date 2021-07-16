//
//  Views.swift
//  Delicious
//
//  Created by Anonymos on 16/07/2021.
//

import SwiftUI

struct TabbarView: View {
  var body: some View {
    ZStack {
      VStack {
        Spacer()
        BezierShape()
          .fill(Color.white)
          .background(Color.clear)
          .frame(width: Dimensions.scrW,
                 height: Dimensions.bottomArea + 50)
        Spacer().frame(height: 5)
      }
      VStack {
        CircleView()
      }
      VStack {
        Spacer().frame(height: 60)
        HStack {
          Spacer()
          BarButton(title: "Home", image: "ic_home")
          Spacer()
          Spacer()
          Spacer()
          Spacer()
          BarButton(title: "Profile", image: "ic_profile")
          Spacer()
        }
      }
    }
    .frame(width: Dimensions.scrW, height: Dimensions.bottomArea + 125)
  }
  
  struct BarButton: View {
    var title: String
    var image: String
    
    var body: some View {
      VStack {
        Image(image).resizable()
          .scaledToFill()
          .frame(width: 20, height: 20)
        Text(title).font(Font.system(size: 13))
      }
    }
  }
  
  struct CircleView: View {
    var body: some View {
      ZStack {
        Image("ic_cart")
          .resizable()
          .frame(width: 80.0, height:80)
        Button("", action: {
          
        })
      }
    }
  }
  
  struct BezierShape: Shape {
    func path(in rect: CGRect) -> Path {
      let bezierPath = createBezierPath()
      return Path(bezierPath.cgPath)
    }
    func createBezierPath() -> UIBezierPath {
      let scrW = UIScreen.main.bounds.width
      let curve1X: CGFloat = scrW / 2 - 80
      let curve2X: CGFloat = scrW / 2 + 80
      let curve3X: CGFloat = scrW - 50
      let curve4X: CGFloat = 50
      
      let height = Dimensions.bottomArea + 50
      
      // create a new path
      let path = UIBezierPath()
      path.move(to: CGPoint(x: 15, y: 0))
      path.addLine(to: CGPoint(x: curve1X, y: 0))
      path.addCurve(to: CGPoint(x: scrW / 2, y: 35), // ending point
                    controlPoint1: CGPoint(x: curve1X + 24, y: 0),
                    controlPoint2: CGPoint(x: curve1X + 40, y: 35))
      path.addCurve(to: CGPoint(x: curve2X, y: 0), // ending point
                    controlPoint1: CGPoint(x: curve2X - 40, y: 35),
                    controlPoint2: CGPoint(x: curve2X - 24, y: 0))
      path.addLine(to: CGPoint(x: scrW - 20, y: 0))
      
      path.addCurve(to: CGPoint(x: scrW - 5, y: 15), // ending point
                    controlPoint1: CGPoint(x: scrW - 15, y: 0),
                    controlPoint2: CGPoint(x: scrW - 5, y: 0))
      path.addLine(to: CGPoint(x: scrW - 5, y: 30))
      
      path.addCurve(to: CGPoint(x: curve3X, y: height), // ending point
                    controlPoint1: CGPoint(x: scrW - 5, y: height),
                    controlPoint2: CGPoint(x: scrW - 30, y: height))
      path.addLine(to: CGPoint(x: curve4X, y: height))
      path.addCurve(to: CGPoint(x: 5, y: 30), // ending point
                    controlPoint1: CGPoint(x: 30, y: height),
                    controlPoint2: CGPoint(x: 5, y: height))
      path.addLine(to: CGPoint(x: 5, y: 15))
      
      path.addCurve(to: CGPoint(x: 15, y: 0), // ending point
                    controlPoint1: CGPoint(x: 5, y: 0),
                    controlPoint2: CGPoint(x: 15, y: 0))
      
      path.close() // draws the final line to close the path
      
      return path
    }
  }
}

struct TabbarView_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      TabbarView()
        .previewDevice("iPhone 11")
    }
  }
}
