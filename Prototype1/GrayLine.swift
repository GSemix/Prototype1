//
//  GrayLine.swift
//  Prototype1
//
//  Created by Семен Безгин on 08.08.2022.
//

import SwiftUI

struct GrayLine: View {
    var width: CGFloat?
    
    var body: some View {
        Rectangle()
            .frame(width: self.width, height: 1)
            .foregroundColor(Color.lightGray)
            .opacity(0.4)
        
    }
}
