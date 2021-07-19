//
//  Views.swift
//  Delicious
//
//  Created by Anonymos on 16/07/2021.
//

import SwiftUI

struct TabbarView: View {
  @State
  private var isHome: Bool = true
  
  private var bgPath: UIBezierPath {
    let curve1X: CGFloat = Dimensions.scrW / 2 - 80
    let curve2X: CGFloat = Dimensions.scrW / 2 + 80
    let curve3X: CGFloat = Dimensions.scrW - 50
    let curve4X: CGFloat = 50
    
    let height = Dimensions.bottomArea + 50
    
    // create a new path
    let path = UIBezierPath()
    path.move(to: CGPoint(x: 15, y: 0))
    path.addLine(to: CGPoint(x: curve1X, y: 0))
    path.addCurve(to: CGPoint(x: Dimensions.scrW / 2, y: 35),
                  controlPoint1: CGPoint(x: curve1X + 24, y: 0),
                  controlPoint2: CGPoint(x: curve1X + 40, y: 35))
    path.addCurve(to: CGPoint(x: curve2X, y: 0),
                  controlPoint1: CGPoint(x: curve2X - 40, y: 35),
                  controlPoint2: CGPoint(x: curve2X - 24, y: 0))
    path.addLine(to: CGPoint(x: Dimensions.scrW - 20, y: 0))
    
    path.addCurve(to: CGPoint(x: Dimensions.scrW - 5, y: 15),
                  controlPoint1: CGPoint(x: Dimensions.scrW - 15, y: 0),
                  controlPoint2: CGPoint(x: Dimensions.scrW - 5, y: 0))
    path.addLine(to: CGPoint(x: Dimensions.scrW - 5, y: 30))
    
    path.addCurve(to: CGPoint(x: curve3X, y: height),
                  controlPoint1: CGPoint(x: Dimensions.scrW - 5, y: height),
                  controlPoint2: CGPoint(x: Dimensions.scrW - 30, y: height))
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
  
  private var lineHomePath: UIBezierPath {
    let path = UIBezierPath()
    let curve1X: CGFloat = Dimensions.scrW / 2 - 80
    let curve2X: CGFloat = Dimensions.scrW / 2 + 80
    path.move(to: CGPoint(x: 15, y: 0))
    path.addLine(to: CGPoint(x: curve1X, y: 0))
    path.addCurve(to: CGPoint(x: Dimensions.scrW / 2, y: 35),
                  controlPoint1: CGPoint(x: curve1X + 24, y: 0),
                  controlPoint2: CGPoint(x: curve1X + 40, y: 35))
    path.addCurve(to: CGPoint(x: curve2X, y: 0),
                  controlPoint1: CGPoint(x: curve2X - 40, y: 35),
                  controlPoint2: CGPoint(x: curve2X - 24, y: 0))
    path.addLine(to: CGPoint(x: Dimensions.scrW - 20, y: 0))
    return path
  }
  
  private var lineProfilePath: UIBezierPath {
    let path = UIBezierPath()
    let curve1X: CGFloat = Dimensions.scrW / 2 - 80
    let curve2X: CGFloat = Dimensions.scrW / 2 + 80
    path.move(to: CGPoint(x: 15, y: 0))
    path.addLine(to: CGPoint(x: curve1X, y: 0))
    path.addCurve(to: CGPoint(x: Dimensions.scrW / 2, y: 35),
                  controlPoint1: CGPoint(x: curve1X + 24, y: 0),
                  controlPoint2: CGPoint(x: curve1X + 40, y: 35))
    path.addCurve(to: CGPoint(x: curve2X, y: 0),
                  controlPoint1: CGPoint(x: curve2X - 40, y: 35),
                  controlPoint2: CGPoint(x: curve2X - 24, y: 0))
    path.addLine(to: CGPoint(x: Dimensions.scrW - 20, y: 0))
    return path
  }
  
  var body: some View {
    ZStack {
      VStack {
        Spacer()
        BezierShape(path: bgPath)
          .fill(Color.white)
          .background(Color.blue)
          .frame(width: Dimensions.scrW,
                 height: Dimensions.bottomArea + 50)
        Spacer().frame(height: 5)
      }
      AnimLine(path: isHome ? lineHomePath : lineProfilePath)
      VStack {
        CircleView()
      }
      VStack {
        Spacer().frame(height: 60)
        HStack {
          Spacer()
          BarButton(title: "Home", image: "ic_home").onTapGesture {
            isHome = true
          }
          Spacer()
          Spacer()
          Spacer()
          Spacer()
          BarButton(title: "Profile", image: "ic_profile").onTapGesture {
            isHome = false
          }
          Spacer()
        }
      }
    }
    .frame(width: Dimensions.scrW, height: Dimensions.bottomArea + 125)
  }
  
  struct AnimLine: View {
    var path: UIBezierPath
    
    @State
    private var strokeStart: CGFloat = 0
    @State
    private var strokeEnd: CGFloat = 0
    
    var body: some View {
      return BezierShape(path: path)
        .trim(from: strokeStart, to: strokeEnd)
        .stroke(Color.red, style: StrokeStyle(lineWidth: 5, lineCap: .round, lineJoin: .round, miterLimit: 10))
        .foregroundColor(Color.white)
        .onAppear() {
          Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
            withAnimation(Animation.easeOut(duration: 0.5)) {
              self.strokeEnd += 0.25
              self.strokeStart = min(self.strokeEnd - 0.25, 0.75)
              
            }
          }
        }
    }
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
    var path: UIBezierPath
    
    func path(in rect: CGRect) -> Path {
      let bezierPath = path
      return Path(bezierPath.cgPath)
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
