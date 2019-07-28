//
//  NetworkOperation.swift
//  OperationKit_Example
//
//  Created by Victor Shabanov on 28/07/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import OperationKit

final class NetworkOperation: AsyncChainableOperation {
    
    override func main() {
        let inputData = input?.obtainChainableOperationInputData()
        
        if let request = inputData as? URLRequest {
            let dataTask = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
                self?.completeOperation(data: error == nil ? data : nil, error: error)
            }
            
            dataTask.resume()
        }
        else {
            completeOperation(data: nil, error: ChainableOperationError.invalidInputData)
        }
    }
}
