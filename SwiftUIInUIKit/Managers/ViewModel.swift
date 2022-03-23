//
//  EventsViewModel.swift
//  SwiftUIInUIKit
//
//  Created by bim on 23/03/2022.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var uiKitValue: Int = 0
    @Published var swiftUIValue: Int = 0
    
    weak var delegate: ViewModelDelegate?
    
    func updateUiKitValue(by increment: Int) {
        uiKitValue += increment
        delegate?.viewModelDidUpdate(self)
    }
    
    func updateSwiftUIValue(by increment: Int) {
        swiftUIValue += increment
        delegate?.viewModelDidUpdate(self)
    }
}

