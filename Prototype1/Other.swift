//
//  Other.swift
//  Prototype1
//
//  Created by Семен Безгин on 07.08.2022.
//

import SwiftUI

struct Other: View {
    @StateObject var viewRouter: ViewRouter
    @ObservedObject var viewModel: ViewModel
    @Binding var Numbers: [Int]
    @Binding var currentName: String
    @Binding var currentFloor: Int
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                
                PlaceButton(viewRouter: self.viewRouter, currentName: self.$currentName)
            }
            
            Spacer()
            
            HStack {
                FloorButtons(Numbers: self.Numbers, currentFloor: self.$currentFloor)
                
                Spacer()
                
                ZoomButtons(viewModel: viewModel)
            }
            
            Spacer()
            Spacer()
                .frame(height: UIScreen.main.bounds.height*0.06)
        }
    }
}
