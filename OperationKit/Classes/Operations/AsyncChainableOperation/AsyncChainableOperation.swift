//
//  AsyncChainableOperation.swift
//  OperationKit
//
//  Created by Victor Shabanov on 26/07/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

open class AsyncChainableOperation: AsyncOperation, ChainableOperation {
    
    open var input: ChainableOperationInput?
    open var output: ChainableOperationOutput?
    open var delegate: ChainableOperationDelegate?
    
    open func completeOperation(data: Any?, error: Error?) {
        output?.didCompleteChainableOperation(outputData: data)
        delegate?.didCompleteChainableOperation(error: error)
        
        complete()
    }
}
