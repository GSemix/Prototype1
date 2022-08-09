//
//  Menu.swift
//  Prototype1
//
//  Created by Семен Безгин on 08.08.2022.
//

import SwiftUI

struct Menu: View {
    @StateObject var viewRouter: ViewRouter
    
    var body: some View {
        HStack {
            Color.white
                .frame(width: UIScreen.main.bounds.width*0.7)
                .overlay(
                    VStack(alignment: .leading) {
                        ZStack {
                            HStack {
                                Image("msu")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.main.bounds.width*0.7/7)
                                    .foregroundColor(Color.purpleEnd)
                                    .padding(.leading, UIScreen.main.bounds.width*0.05)
                                
                                Spacer()
                            }
                            HStack {
                                Spacer()
                                
                                Text("Навигация МГУ")
                                    .foregroundColor(Color.purpleEnd)
                                    .fontWeight(.semibold)
                                    .font(.system(size: UIScreen.main.bounds.width * 0.04))
                                   
                                Spacer()
                            }
                        }
                        .padding(.top, UIScreen.main.bounds.height*0.025)
                        .padding(.bottom, UIScreen.main.bounds.height*0.015)
                        
                        VStack {
                            MenuButton(viewRouter: viewRouter, image: Image(systemName: "network"), description: "Язык")
                            
                            MenuButton(viewRouter: viewRouter, image: Image(systemName: "message"), description: "Оставить отзыв")
                            
                            MenuButton(viewRouter: viewRouter, image: Image(systemName: "arrow.down.to.line"), description: "Включить оффлайн режим")
                        }
                        .padding(.leading, UIScreen.main.bounds.width*0.05)
                        
                        Spacer()
                    }
                )
            
            Spacer()
        }
    }
}

struct MenuButton: View {
    @StateObject var viewRouter: ViewRouter
    let image: Image
    let description: String
    
    var body: some View {
        Button(action: {
            withAnimation {
                viewRouter.currentPage = .place
            }
        }) {
            HStack {
                self.image
                    .resizable()
                    .scaledToFit()
                    .frame(height: UIScreen.main.bounds.width*0.7/15)
                    .foregroundColor(Color.lightGray1)
                    .padding(.trailing, UIScreen.main.bounds.width*0.005)
                    .font(.headline)
                
                Text(self.description)
                    .foregroundColor(Color.lightGray1)
                    .fontWeight(.semibold)
                    .font(.system(size: UIScreen.main.bounds.width * 0.035))
                
                Spacer()
            }
            .background(.white)
            .padding(.vertical, UIScreen.main.bounds.height*0.025)
        }
        .buttonStyle(GrowingButton())
    }
}
