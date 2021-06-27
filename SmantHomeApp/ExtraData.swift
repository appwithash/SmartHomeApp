//
//  ExtraData.swift
//  SmantHomeApp
//
//  Created by ashutosh on 03/06/21.
//

import Foundation
import SwiftUI

struct Screen{
    static let maxWidth = UIScreen.main.bounds.width
    static let maxHeight = UIScreen.main.bounds.height
}

extension Color{
    static let cream = Color("cream")
    static let lightCream = Color("lightCream")
    static let lightPurple = Color("lightPurple")
    static let grey = Color("grey")
}
struct Blur: UIViewRepresentable {
    let style: UIBlurEffect.Style = .systemUltraThinMaterial

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
extension View {
    
    /// Hide or show the view based on a boolean value.
    ///
    /// Example for visibility:
    ///
    ///     Text("Label")
    ///         .isHidden(true)
    ///
    /// Example for complete removal:
    ///
    ///     Text("Label")
    ///         .isHidden(true, remove: true)
    ///
    /// - Parameters:
    ///   - hidden: Set to `false` to show the view. Set to `true` to hide the view.
    ///   - remove: Boolean value indicating whether or not to remove the view.
    @ViewBuilder func isHidden(_ hidden: Bool, remove: Bool = false) -> some View {
        if hidden {
            if !remove {
                self.hidden()
            }
        } else {
            self
        }
    }
}
