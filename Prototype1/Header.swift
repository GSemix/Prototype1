//
//  Header.swift
//  Prototype1
//
//  Created by Семен Безгин on 07.08.2022.
//

import SwiftUI

struct Header: View {
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                    .frame(
                        width: geometry.size.width,
                        height: geometry.safeAreaInsets.top,
                        alignment: .center
                    )
                    .background(.ultraThickMaterial)
                
                Spacer()
            }
            .edgesIgnoringSafeArea(.top)
        }
    }
}
