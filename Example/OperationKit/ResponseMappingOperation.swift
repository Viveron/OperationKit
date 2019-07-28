//
//  ResponseMappingOperation.swift
//  OperationKit_Example
//
//  Created by Victor Shabanov on 28/07/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import OperationKit

final class ResponseMappingOperation: AsyncChainableOperation {
    
    override func main() {
        let inputData = input?.obtainChainableOperationInputData()
        
        var image: UIImage?
        var error: Error?
        
        if let data = inputData as? Data {
            image = UIImage(data: data)
            
            if image == nil {
                error = ChainableOperationError.emptyResultData
            }
        } else {
            error = ChainableOperationError.invalidInputData
        }
        
        completeOperation(data: image, error: error)
    }
}
