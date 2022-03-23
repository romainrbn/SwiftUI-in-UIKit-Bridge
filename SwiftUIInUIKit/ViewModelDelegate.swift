//
//  ViewModelDelegate.swift
//  SwiftUIInUIKit
//
//  Created by bim on 23/03/2022.
//

import Foundation

protocol ViewModelDelegate: AnyObject {
    func viewModelDidUpdate(_ viewModel: ViewModel)
}
