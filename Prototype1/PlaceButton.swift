//
//  PlaceButton.swift
//  Prototype1
//
//  Created by Семен Безгин on 08.08.2022.
//

import SwiftUI

struct PlaceButton: View {
    @StateObject var viewRouter: ViewRouter
    @Binding var currentName: String
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.viewRouter.currentPage = .place
            }
        }) {
            Text(self.currentName)
                .bold()
                .font(.system(size: UIScreen.main.bounds.width*0.035))
                .foregroundColor(Color.darkEnd)
                .padding(.vertical, UIScreen.main.bounds.width*0.04)
                .padding(.horizontal, UIScreen.main.bounds.width*0.05)
                .clipped()
        }
        .background(.white)
        .cornerRadius(10)
        .shadow(color: Color.lightGray, radius: 5)
        .buttonStyle(GrowingButton())
        .padding([.top, .trailing], UIScreen.main.bounds.width*0.02)
    }
}
