//
//  SwiftUIManager.swift
//  SwiftUIInUIKit
//
//  Created by bim on 23/03/2022.
//

import UIKit
import SwiftUI

extension UIViewController {
    func addSwiftUISubview<Content: View>(_ swiftUIView: Content, to view: UIView, with constraints: ((UIView) -> Void)?) -> UIView {
        let hostingController = UIHostingController(rootView: swiftUIView)
        
        addChild(hostingController)
        
        view.addSubview(hostingController.view)
        
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        
        if constraints == nil {
            NSLayoutConstraint.activate([
                hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
                hostingController.view.leftAnchor.constraint(equalTo: view.leftAnchor),
                view.bottomAnchor.constraint(equalTo: hostingController.view.bottomAnchor),
                view.rightAnchor.constraint(equalTo: hostingController.view.rightAnchor)
            ])
        }
        
        hostingController.didMove(toParent: self)
        
        if let constraints = constraints {
            constraints(hostingController.view)
        }
        
        return hostingController.view
    }
}

