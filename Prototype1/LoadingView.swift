//
//  LoadingView.swift
//  xxx
//
//  Created by Семен Безгин on 29.05.2022.
//

import SwiftUI

struct LoadingView<Content>: View where Content: View {
    @Binding var isShowing: Bool
    var content: () -> Content
    @State var loading: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .center) {
                self.content()
                
                VStack {
                    Circle()
                        .trim(from: 0.5, to: 1)
                        .stroke(Color.purpleStart, lineWidth: 10)
                        .frame(width: UIScreen.main.bounds.width / 6, height: UIScreen.main.bounds.width / 6, alignment: .center)
                        .rotationEffect(Angle(degrees: self.loading ? 0 : 360))
                        .onAppear(perform: {
                            withAnimation(Animation.linear(duration: 0.5).repeatForever(autoreverses: false)) {
                                self.loading.toggle()
                            }
                        })
                }
                .frame(width: geometry.size.width / 2,
                       height: geometry.size.height / 5)
                .onAppear {
                    self.isShowing = true
                }
            }
        }
    }
}
