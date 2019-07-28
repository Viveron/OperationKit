//
//  ViewController.swift
//  OperationKit
//
//  Created by viveron on 07/26/2019.
//  Copyright (c) 2019 viveron. All rights reserved.
//

import UIKit
import OperationKit

class ViewController: UIViewController {

    private let sheduler = OperationScheduler()
    
    lazy var button = UIButton(type: .system)
    lazy var imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        button.addTarget(self, action: #selector(buttonTapAction), for: .touchUpInside)
        button.setTitle("Update image", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        view.addSubview(button)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.widthAnchor.constraint(equalToConstant: 120).isActive = true
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
    }
    
    // MARK: - Private methods
    
    @objc private func buttonTapAction() {
        button.isEnabled = false
        imageView.alpha = 0.5
        
        let operations = [
            RequestConfigurationOperation(),
            NetworkOperation(),
            ResponseMappingOperation()
        ]
        
        let operation = OperatoinBuilder(operations)
            .build(inputData: UIScreen.main.bounds.size)
        
        operation.result = { [weak self] data, error in
            DispatchQueue.main.async {
                if error != nil {
                    print("Load error:")
                    debugPrint(error!)
                }
                
                if let image = data as? UIImage {
                    self?.imageView.image = image
                    self?.imageView.alpha = 1
                }
                
                self?.button.isEnabled = true
            }
        }
        
        sheduler.addOperation(operation)
    }
}

