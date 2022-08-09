//
//  StylesModificatorsShapes.swift
//  Prototype1
//
//  Created by Семен Безгин on 06.08.2022.
//

import SwiftUI

struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct GrowingButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.3 : 1)
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct BlurBG : UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {

        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        
        return view
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        
    }
}
