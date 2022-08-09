//
//  Properties.swift
//  Prototype1
//
//  Created by Семен Безгин on 06.08.2022.
//

import SwiftUI

struct PagePropertiesView: View {
    @State var url: String = ""
    
    var body: some View {
        TextField("URL", text: $url)
        

    }
}
