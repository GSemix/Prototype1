//
//  Chin.swift
//  Prototype1
//
//  Created by Семен Безгин on 07.08.2022.
//

import SwiftUI

struct Chin: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                Spacer()
                    .frame(
                        width: geometry.size.width,
                        height: geometry.safeAreaInsets.bottom,
                        alignment: .center
                    )
                    .background(.ultraThickMaterial)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}
