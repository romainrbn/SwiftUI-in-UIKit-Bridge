//
//  ViewController.swift
//  SwiftUIInUIKit
//
//  Created by bim on 23/03/2022.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    
    var swiftUILabelView: UIView!
    var swiftUIButtonView: UIView!
    
    var uiKitLabel: UILabel!
    var uiKitButton: UIButton!
        
    private let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "SwiftUI - UIKit 🤝"
        
        view.backgroundColor = .systemBackground
        
        createLayout()
    }
    
    // MARK: - Create views
    func createLayout() {
        
        // Create SwiftUI Label
        swiftUILabelView = self.addSwiftUISubview(SwiftUILabel(viewModel: viewModel), to: self.view) { swiftUIView in
            NSLayoutConstraint.activate([
                swiftUIView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
                swiftUIView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20)
            ])
        }
        
        // Create SwiftUI Button
        
        swiftUIButtonView = self.addSwiftUISubview(SwiftUIButton(viewModel: viewModel), to: self.view) { swiftUIView in
            NSLayoutConstraint.activate([
                swiftUIView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
                swiftUIView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
            ])
        }
        
        // Create UIKit Label
        
        uiKitLabel = UILabel()
        uiKitLabel.text = "I am a UIKit Label and my value is \(viewModel.uiKitValue)"
        
        self.view.addSubview(uiKitLabel)
        
        uiKitLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            uiKitLabel.topAnchor.constraint(equalTo: swiftUILabelView.bottomAnchor, constant: 10),
            uiKitLabel.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
        
        // Create UIKit Button
        uiKitButton = UIButton()
        uiKitButton.backgroundColor = .systemBackground
        uiKitButton.setTitleColor(.systemBlue, for: .normal)
        uiKitButton.setTitle("UIKit Button", for: .normal)
        uiKitButton.addTarget(self, action: #selector(handleUIKitButtonTapped), for: .touchUpInside)
        
        self.view.addSubview(uiKitButton)
        
        uiKitButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            uiKitButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            uiKitButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
    }
    
    @objc
    func handleUIKitButtonTapped() {
        self.viewModel.updateSwiftUIValue(by: 1)
    }
}

extension ViewController: ViewModelDelegate {
    func viewModelDidUpdate(_ viewModel: ViewModel) {
        uiKitLabel.text = "I am a UIKit Label and my value is \(viewModel.uiKitValue)"
    }
}
