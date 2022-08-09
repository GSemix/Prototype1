//
//  ZoomButtons.swift
//  Prototype1
//
//  Created by Семен Безгин on 07.08.2022.
//

import SwiftUI

struct ZoomButtons: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.white)
                .shadow(color: Color.lightGray, radius: 5)
                .overlay(content: {
                    VStack {
                        Spacer()
                        
                        Button(action: {
                            viewModel.webViewNavigationPublisher.send(.plus)
                        }) {
                            Image(systemName: "plus")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.darkEnd)
                                .frame(width: UIScreen.main.bounds.height*0.02, height: UIScreen.main.bounds.height*0.02)
                                .font(.headline)
                        }
                        .buttonStyle(GrowingButton())
                        
                        Spacer()
                        
                        GrayLine(width: UIScreen.main.bounds.width*0.08)
                        
                        Spacer()
                        
                        Button(action: {
                            viewModel.webViewNavigationPublisher.send(.minus)
                        }) {
                            Image(systemName: "minus")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .foregroundColor(Color.darkEnd)
                                .frame(width: UIScreen.main.bounds.height*0.02, height: UIScreen.main.bounds.height*0.02)
                                .background(Color.white)
                                .font(.headline)
                        }
                        .buttonStyle(GrowingButton())
                        
                        Spacer()
                    }
                })
                .frame(width: UIScreen.main.bounds.width*0.125, height: UIScreen.main.bounds.height*0.125)
                .padding(.trailing, UIScreen.main.bounds.width*0.02)
            
            Spacer()
        }
    }
}
