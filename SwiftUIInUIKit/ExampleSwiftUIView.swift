//
//  ExampleSwiftUIView.swift
//  SwiftUIInUIKit
//
//  Created by bim on 23/03/2022.
//

import SwiftUI

struct SwiftUILabel: View {
    
    @State private var labelValue = 0
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        Text("I am a SwiftUI Label and my value is \(viewModel.swiftUIValue)")
    }
}

struct SwiftUIButton: View {
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        Button(action: {
            viewModel.updateUiKitValue(by: 1)
        }) {
            Text("SwiftUI Button")
        }
    }
}
