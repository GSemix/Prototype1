//
//  PagePlacesView.swift
//  Prototype1
//
//  Created by Семен Безгин on 08.08.2022.
//

import SwiftUI

struct PagePlacesView: View {
    @StateObject var viewRouter: ViewRouter
    @Binding var currentName: String
    @State var notConfirmedCurrentName: String?
    
    var body: some View {
        Color.white
        VStack {
            ZStack {
                HStack {
                    Button(action: {
                        withAnimation {
                            viewRouter.currentPage = .main
                        }
                    }) {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color.darkEnd)
                            .frame(width: UIScreen.main.bounds.width*0.05)
                            .font(.headline)
                            .clipShape(Capsule())
                    }
                    .buttonStyle(GrowingButton())
                    
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    
                    Text("Комплекс")
                        .bold()
                        .font(.title2)
                        .foregroundColor(Color.darkEnd)
                    
                    Spacer()
                }
            }
            .padding(.top, UIScreen.main.bounds.width*0.045)
            .padding(.bottom, UIScreen.main.bounds.height*0.025)
            
            VStack(spacing: 0) {
                Place(name: "Покровка", address: "Покровский бульвар 11", notConfirmedCurrentName: $notConfirmedCurrentName)
                
                GrayLine()
                
                Place(name: "Шаболовка", address: "улица Шаболовка 26с3", notConfirmedCurrentName: $notConfirmedCurrentName)
                
                GrayLine()
                
                Place(name: "Мясницкая", address: "Мясницкая улица 11, 20; Кривоколенный переулок 3, 3а; Армянский переулок 4/2", notConfirmedCurrentName: $notConfirmedCurrentName)
                
                GrayLine()
                
                Place(name: "Ордынка", address: "улица Малая Ордынка 29", notConfirmedCurrentName: $notConfirmedCurrentName)
            }
            Color.white
            
            
            ConfirmButton(viewRouter: viewRouter, currentName: self.$currentName, notConfirmedCurrentName: self.$notConfirmedCurrentName)
        }
        .padding(.horizontal, UIScreen.main.bounds.width*0.06)
        .onAppear(perform: {
            self.notConfirmedCurrentName = self.currentName
        })
    }
}

struct Place: View {
    let name: String
    let address: String
    @Binding var notConfirmedCurrentName: String?
    
    var body: some View {
        Button(action: {
            self.notConfirmedCurrentName = name
        }) {
            HStack {
                VStack(alignment: .leading) {
                    Text(self.name)
                        .bold()
                        .foregroundColor(Color.purpleStart)
                        .font(.system(size: UIScreen.main.bounds.width*0.04))
                        .padding(.bottom, UIScreen.main.bounds.height*0.005)
                    
                    Text(self.address)
                        .foregroundColor(Color.darkStart)
                        .font(.system(size: UIScreen.main.bounds.width*0.032))
                        .lineLimit(nil)
                }
                
                Spacer()
                
                Circle()
                    .frame(width: UIScreen.main.bounds.width*0.015)
                    .foregroundColor(.white)
                    .background(
                        Circle()
                            .strokeBorder(Color.lightGray, lineWidth: self.notConfirmedCurrentName == name ? 0 : 1)
                            .background(
                                Circle()
                                    .foregroundColor(self.notConfirmedCurrentName == self.name ? Color.purpleStart : Color.white)
                            )
                            .frame(width: UIScreen.main.bounds.width*0.04)
                    )
                    .padding(.leading, UIScreen.main.bounds.width*0.015)
            }
            .background(Color.white)
        }
        .buttonStyle(GrowingButton())
    }
}
