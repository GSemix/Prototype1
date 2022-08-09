//
//  Floors.swift
//  Prototype1
//
//  Created by Семен Безгин on 07.08.2022.
//

import SwiftUI

struct FloorButtons: View {
    let Numbers: [Int]
    @Binding var currentFloor: Int
    var isScrolling: Bool {
        return self.Numbers.count > 12
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            ScrollViewReader { value in
                VStack(spacing: 0) {
                    ForEach(self.Numbers, id: \.self) { number in
                        Floor(num: number, currentFloor: self.$currentFloor)
                            .id(self.Numbers.firstIndex(of: number))
                    }
                }
                .padding(.vertical, UIScreen.main.bounds.width*0.005)
                .onAppear(perform: {
                    if self.isScrolling {
                        value.scrollTo(self.Numbers.firstIndex(of: self.currentFloor), anchor: .bottom)
                    }
                })
            }
        }
        .scrollEnabled(self.isScrolling)
        .frame(width: UIScreen.main.bounds.width*0.11)
        .frame(height: self.isScrolling ? UIScreen.main.bounds.width * (12 * (0.09 + 0.005 * 2)) + UIScreen.main.bounds.width * 0.005 * 2 : UIScreen.main.bounds.width * (CGFloat(self.Numbers.count) * (0.09 + 0.005 * 2)) + UIScreen.main.bounds.width * 0.005 * 2)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: Color.lightGray, radius: 5)
        .padding(.leading, UIScreen.main.bounds.width*0.02)
    }
}

struct Floor: View {
    let num: Int
    @Binding var currentFloor: Int
    
    var body: some View {
        Button(action: {
            self.currentFloor = num
        }) {
            Text(String(num))
                .bold()
                .font(.system(size: self.currentFloor == num ? UIScreen.main.bounds.width*0.07 : UIScreen.main.bounds.width*0.035))
                .foregroundColor(self.currentFloor == num ? Color.white : Color.darkEnd)
                .frame(width: UIScreen.main.bounds.width*0.09, height: UIScreen.main.bounds.width*0.09)
                .padding(.vertical, UIScreen.main.bounds.width*0.005)
                .padding(.horizontal, UIScreen.main.bounds.width*0.005)
                .background(self.currentFloor == num ? Color.purpleStart : Color.clear)
                .cornerRadius(7)
                .clipped()
        }
        .buttonStyle(GrowingButton())
    }
}
