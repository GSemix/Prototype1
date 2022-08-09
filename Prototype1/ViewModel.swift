//
//  ViewModel.swift
//  3DMap
//
//  Created by Семен Безгин on 05.08.2022.
//

import Foundation
import Combine

class ViewModel: ObservableObject {
    var isLoaderVisible = PassthroughSubject<Bool, Never>();
    var webTitle = PassthroughSubject<String, Never>()
    var webViewNavigationPublisher = PassthroughSubject<WebViewNavigationAction, Never>()
}
