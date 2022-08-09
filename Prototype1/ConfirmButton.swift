//
//  ConfirmButton.swift
//  Prototype1
//
//  Created by Семен Безгин on 08.08.2022.
//

import SwiftUI

struct ConfirmButton: View {
    @StateObject var viewRouter: ViewRouter
    @Binding var currentName: String
    @Binding var notConfirmedCurrentName: String?

    var body: some View {
        Button(action: {
            self.currentName = self.notConfirmedCurrentName!
            
            withAnimation {
                self.viewRouter.currentPage = .main
            }
        }) {
            HStack {
                Spacer()
                
                Text("Подтвердить")
                    .bold()
                    .font(.headline)
                    .foregroundColor(Color.white)
                
                Spacer()
            }
            .padding(.vertical, UIScreen.main.bounds.width*0.04)
            .background(Color.purpleStart)
            .cornerRadius(7)
            .clipped()
        }
        .buttonStyle(GrowingButton())
        .padding(.bottom, UIScreen.main.bounds.width*0.05)
    }
}
