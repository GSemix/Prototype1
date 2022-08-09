//
//  TabBarView.swift
//  Prototype1
//
//  Created by Семен Безгин on 06.08.2022.
//

import SwiftUI

struct tabBarIcons: View {
    @StateObject var viewRouter: ViewRouter
    @Binding var isPopUp: Bool
    var showTabBar: [Page] = [.menu, .main, .search, .route, .qr]
    
    var body: some View {
        if showTabBar.contains(viewRouter.currentPage) {
            VStack {
                Spacer()

                VStack(spacing: 0) {
                    Color.white
                        .shadow(color: Color.lightGray, radius: 5)
                        .overlay(content: {
                            VStack {
                                Spacer()
                                
                                HStack {
                                    Icon(viewRouter: viewRouter, assignedPage: .menu, systemIconName: "line.3.horizontal", tabName: "Меню", isPopUp: self.$isPopUp)
                                    
                                    Spacer()
                                    
                                    Icon(viewRouter: viewRouter, assignedPage: .search, systemIconName: "magnifyingglass", tabName: "Поиск", isPopUp: self.$isPopUp)
                                    
                                    Spacer()
                                    
                                    Icon(viewRouter: viewRouter, assignedPage: .route, systemIconName: "arrow.triangle.swap", tabName: "Маршрут", isPopUp: self.$isPopUp)
                                    
                                    Spacer()
                                    
                                    Icon(viewRouter: viewRouter, assignedPage: .qr, systemIconName: "qrcode.viewfinder", tabName: "QR-сканер", isPopUp: self.$isPopUp)
                                }
                                .padding(.horizontal, UIScreen.main.bounds.width*0.1)
                                .padding(.vertical)
                                
                                Spacer()
                            }
                        })
                        .frame(height: UIScreen.main.bounds.height*0.06)
                }
            }
        }
    }
}

struct Icon: View {
    @StateObject var viewRouter: ViewRouter
    let assignedPage: Page
    let systemIconName, tabName: String
    @Binding var isPopUp: Bool
    
    var body: some View {
        VStack {
            Spacer()
            
            Button (action: {
                withAnimation {
                    if assignedPage == .search || assignedPage == .route || assignedPage == .qr {
                        self.isPopUp = true
                    }
                    
                    if viewRouter.currentPage == .menu && assignedPage == .menu {
                        withAnimation {
                            viewRouter.currentPage = .main
                        }
                    } else {
                        viewRouter.currentPage = assignedPage
                    }
                }
            }) {
                VStack(spacing: UIScreen.main.bounds.height*0.002) {
                    Image(systemName: systemIconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: UIScreen.main.bounds.width/20, height: UIScreen.main.bounds.height/45)
                        .foregroundColor(Color(assignedPage == .menu && viewRouter.currentPage == .menu ? UIColor(Color.purpleStart) : UIColor(Color.darkEnd)))
                        .font(.headline)
                    
                    Text(tabName)
                        .bold()
                        .font(.system(size: 10)) // 18
                        .foregroundColor(Color(assignedPage == .menu && viewRouter.currentPage == .menu ? UIColor(Color.purpleStart) : UIColor(Color.darkEnd)))
                }
            }
            .buttonStyle(GrowingButton())
            
            Spacer()
        }
    }
}
