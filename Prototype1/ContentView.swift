//
//  ContentView.swift
//  Prototype1
//
//  Created by Семен Безгин on 06.08.2022.
//

import SwiftUI

enum Page {
    case main
    case place
    case menu
    case search
    case route
    case qr
}

struct url {
    var stringURL: String
    var typeURL: URLType
}

class ViewRouter: ObservableObject {
    @Published var currentPage: Page = .main
}

struct ContentView: View {
    @StateObject var viewRouter: ViewRouter
    @StateObject var viewModel = ViewModel()
    @State var currentName: String = "Покровка"
    @State var offsetMenu: Bool = false
    @State var Numbers: [Int] = []
    let offset: CGFloat = (-0.7) * UIScreen.main.bounds.width
    @State var currentFloor: Int = 1
    @State var isLoaderVisible = false
    @State var urls: Dictionary<Int, url> = [
        1 : url(stringURL: "Site/local", typeURL: .local),
        2 : url(stringURL: "https://www.google.com", typeURL: .public),
        3 : url(stringURL: "Site/index", typeURL: .local),
        4 : url(stringURL: "https://yandex.ru/maps/213/moscow/?ll=37.621543%2C55.752174&z=15.32", typeURL: .public)
    ]
    @State var message: String = ""
    @State var isPopUp: Bool = false
    
    var body: some View {
        ZStack {
            ZStack {
                ZStack {
                    ZStack {
                        if self.urls.keys.contains(self.currentFloor) {
                            VStack(spacing: 0) {
                                WebView(type: self.urls[self.currentFloor]?.typeURL ?? .local, url: self.urls[self.currentFloor]?.stringURL ?? "", viewModel: viewModel, message: self.$message)
                                    .onAppear(perform: {
                                        print("[+] WebView Restarted")
                                    })
                                    .onReceive(self.viewModel.isLoaderVisible.receive(on: RunLoop.main)) { value in
                                        withAnimation {
                                            self.isLoaderVisible = value
                                        }
                                        
                                        print(">>>>>>>>>>>     \(value)")
                                    }
                                    .onChange(of: self.message) { value in
                                        if value == "Hello" {
                                            withAnimation {
                                                self.viewRouter.currentPage = .menu
                                            }
                                        }
                                    }
                                
                                Spacer()
                                    .frame(height: UIScreen.main.bounds.height*0.06)
                            }
                        } else {
                            Color.offWhite1
                                .edgesIgnoringSafeArea(.all)
                        }
                        
                        if self.isLoaderVisible {
                            LoaderView()
                        }
                        
                        Other(viewRouter: viewRouter, viewModel: viewModel, Numbers: $Numbers, currentName: self.$currentName, currentFloor: self.$currentFloor)
                    }
                    .blur(radius: self.offsetMenu ? 2.0 : 0)
                    .overlay(
                        self.offsetMenu || self.isLoaderVisible ? Color.black.opacity(0.1) : Color.clear
                    )
                    .disabled(viewRouter.currentPage == .menu)
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            if self.viewRouter.currentPage != .main {
                                self.viewRouter.currentPage = .main
                            }
                            
                            self.offsetMenu = false
                        }
                    }
                    .transition(.opacity)
                    
                    Menu(viewRouter: viewRouter)
                        .offset(x: self.offsetMenu ? .zero : self.offset)
                }
                .onAppear(perform: {
                    if self.currentName == "Покровка" {
                        self.Numbers = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, -1, -2]
                    } else if self.currentName == "Шаболовка" {
                        self.Numbers = [4, 3, 2, 1, 0]
                    } else if self.currentName == "Мясницкая" {
                        self.Numbers = [6, 5, 4, 3, 2, 1, 0]
                    } else if self.currentName == "Ордынка" {
                        self.Numbers = [5, 4, 3, 2, 1, 0]
                    }
                })
                
                
                tabBarIcons(viewRouter: viewRouter, isPopUp: self.$isPopUp)
                    .onChange(of: self.viewRouter.currentPage) { value in
                        if value == .menu {
                            withAnimation {
                                self.offsetMenu = true
                            }
                        } else if value == .main {
                            if self.currentName == "Покровка" {
                                self.Numbers = [10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, -1, -2]
                            } else if self.currentName == "Шаболовка" {
                                self.Numbers = [4, 3, 2, 1, 0]
                            } else if self.currentName == "Мясницкая" {
                                self.Numbers = [6, 5, 4, 3, 2, 1, 0]
                            } else if self.currentName == "Ордынка" {
                                self.Numbers = [5, 4, 3, 2, 1, 0]
                            }
                            
                            withAnimation {
                                self.offsetMenu = false
                            }
                        }
                    }
                
                //            VStack {
                //                Header()
                //
                //                Chin()
                //            }
                
                if self.viewRouter.currentPage == .place {
                    PagePlacesView(viewRouter: viewRouter, currentName: self.$currentName)
                        .transition(.slide)
                }
            }
            .onChange(of: self.currentName) { value in
                self.currentFloor = 1
                
                if self.urls[2]!.stringURL == "https://www.youtube.com" {
                    self.urls[2]!.stringURL = "https://www.google.com"
                } else {
                    self.urls[2]!.stringURL = "https://www.youtube.com"
                }
            }
            .popup(isPresented: self.$isPopUp, type: .toast, position: .bottom, animation: .easeInOut(duration: 0.35), closeOnTap: true, closeOnTapOutside: true, dismissCallback: {}) {
                Color.white
                    .frame(height: UIScreen.main.bounds.height)
            }
            .preferredColorScheme(.light)
            
            VStack {
                Header()
                
                Chin()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewRouter: ViewRouter())
    }
}
