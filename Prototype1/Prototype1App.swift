//
//  Prototype1App.swift
//  Prototype1
//
//  Created by Семен Безгин on 06.08.2022.
//

import SwiftUI

@main
struct Prototype1App: App {
    @StateObject var viewRouter = ViewRouter()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewRouter: viewRouter)
        }
    }
}
