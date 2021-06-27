//
//  Tab.swift
//  SmantHomeApp
//
//  Created by ashutosh on 03/06/21.
//

import SwiftUI

struct Tab: View {
    var body: some View {
        VStack{
        Arc().stroke()//.foregroundColor(.lightPurple)
            CurveShape().stroke()
        }
    }
}
struct CurveShape: Shape {

    var height: CGFloat = 20
    var length: CGFloat = 80
    var startX: CGFloat = 0

    func path(in rect: CGRect) -> Path {
        var path = Path()
     //   let midPoint: CGFloat = 40
//        let apex1: CGFloat = 20
//        let apex2: CGFloat = 50

        path.move(to: CGPoint(x: 0, y: 20))

        path.addCurve(to: CGPoint(x: 30, y: 30), control1: CGPoint(x: 15, y:15)
                      , control2: CGPoint(x: 0, y: 38))

    path.addCurve(to: CGPoint(x: 60, y:20), control1: CGPoint(x: 25, y: 20), control2: CGPoint(x: 20, y: 20))


        return path
    }
}
struct Arc: Shape {

    var height: CGFloat = 20
    var length: CGFloat = 80
    var startX: CGFloat = 0

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let midPoint: CGFloat = 40
        let apex1: CGFloat = 20
        let apex2: CGFloat = 50

        path.move(to: CGPoint(x: startX, y: height))

        path.addCurve(to: CGPoint(x: midPoint, y: 0), control1: CGPoint(x: apex1, y:
            height), control2: CGPoint(x: apex1, y: 0))

        path.addCurve(to: CGPoint(x: length, y: height), control1: CGPoint(x: apex2, y: 0), control2: CGPoint(x: apex2, y: height))


        return path
    }
}
//struct TabShape : Shape{
//    var height: CGFloat = 20
//    var length: CGFloat = 80
//    var startX: CGFloat = 0
//    func path(in rect: CGRect) -> Path {
//        var path = Path()
//        let midPoint: CGFloat = (startX + length) / 2
//        let apex1: CGFloat = (startX + midPoint) / 2
//        let apex2: CGFloat = (midPoint + length) / 2
//        path.move(to: CGPoint(x: 0, y: Screen.maxHeight*0.1))
//        path.addLine(to: CGPoint(x: 0, y: 0))
//        path.addLine(to: CGPoint(x: Screen.maxWidth/7, y: 0))
//    //    path.addArc(tangent1End: CGPoint(x: Screen.maxWidth/7, y: 10), tangent2End: CGPoint(x: 100,y: 30), radius: 15.0)
//
//        path.addCurve(to: CGPoint( x: Screen.maxWidth/7+midPoint, y: 20), control1: CGPoint(x: (Screen.maxWidth/7)+20, y: 30), control2: CGPoint(x: (Screen.maxWidth/7)+20, y: 0))
////        path.addLine(to: CGPoint(x: Screen.maxWidth, y: 0))
////        path.addLine(to: CGPoint(x: Screen.maxWidth, y: Screen.maxHeight*0.1))
////        path.addLine(to: CGPoint(x: 0, y: Screen.maxHeight*0.1))
//
//        return path
//    }
//
//
//}

struct Tab_Previews: PreviewProvider {
    static var previews: some View {
        Tab()
    }
}
