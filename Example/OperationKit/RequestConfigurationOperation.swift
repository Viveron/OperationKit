//
//  RequestConfigurationOperation.swift
//  OperationKit_Example
//
//  Created by Victor Shabanov on 28/07/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import Foundation
import OperationKit

final class RequestConfigurationOperation: AsyncChainableOperation {
    
    override func main() {
        let inputData = input?.obtainChainableOperationInputData()
        
        var request: URLRequest?
        var error: Error?
        
        if let imageSize = inputData as? CGSize {
            let imageId = 1_000 + Int.random(in: 0 ..< 100)
            let imageWidth = Int(ceil(imageSize.width))
            let imageHeight = Int(ceil(imageSize.height))
            
            let url = URL(string: "https://picsum.photos/id/\(imageId)/\(imageWidth)/\(imageHeight)")!
            request = URLRequest(url: url,
                                 cachePolicy: .reloadIgnoringCacheData,
                                 timeoutInterval: 10.0)
        } else {
            error = ChainableOperationError.invalidInputData
        }
        
        completeOperation(data: request, error: error)
    }
}
