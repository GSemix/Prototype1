//
//  Extensions.swift
//  Prototype1
//
//  Created by Семен Безгин on 06.08.2022.
//

import SwiftUI

extension Color {
    static let offWhite = Color(red: 225 / 255, green: 225 / 255, blue: 235 / 255)
    static let offWhite1 = Color(red: 238 / 255, green: 239 / 255, blue: 242 / 255)
    static let lightGray = Color(red: 215 / 255, green: 215 / 255, blue: 215 / 255)
    static let lightGray1 = Color(red: 110 / 255, green: 122 / 255, blue: 147 / 255)
    
    static let darkStart = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
    static let darkEnd = Color(red: 50 / 255, green: 60 / 255, blue: 65 / 255)
//    static let darkEnd = Color(red: 25 / 255, green: 25 / 255, blue: 30 / 255)
    
    static let lightStart = Color(red: 60 / 255, green: 160 / 255, blue: 240 / 255)
    static let lightEnd = Color(red: 30 / 255, green: 80 / 255, blue: 120 / 255)
    
    static let purpleStart = Color(red: 98 / 255, green: 0 / 255, blue: 238 / 255)
    static let purpleEnd = Color(red: 48 / 255, green: 0 / 255, blue: 118 / 255)
}

extension View {
    public func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
    
    public func addBorder<S>(_ content: S, width: CGFloat = 1, cornerRadius: CGFloat) -> some View where S : ShapeStyle {
        let roundedRect = RoundedRectangle(cornerRadius: cornerRadius)
        return clipShape(roundedRect)
            .overlay(roundedRect.strokeBorder(content, lineWidth: width))
    }
    
    @ViewBuilder func scrollEnabled(_ enabled: Bool) -> some View {
        if enabled {
          self
        } else {
          simultaneousGesture(DragGesture(minimumDistance: 0),
                              including: .all)
        }
      }
}

extension LinearGradient {
    init(_ colors: Color...) {
        self.init(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing)
    }
}
