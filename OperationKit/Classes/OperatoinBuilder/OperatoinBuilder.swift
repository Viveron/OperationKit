//
//  OperatoinBuilder.swift
//  OperationKit
//
//  Created by Victor Shabanov on 28/07/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

open class OperatoinBuilder {
    
    private var operationsQueue: [Operation & ChainableOperation] = []
    
    public init(_ operationsQueue: [Operation & ChainableOperation]) {
        for operation in operationsQueue {
            addOperation(operation)
        }
    }
    
    open func addOperation(_ operation: Operation & ChainableOperation) {
        if let lastOperation = operationsQueue.last {
            let buffer = OperationBuffer()
            
            OperationChainer.chain(parentOperation: lastOperation,
                                   childOperation: operation,
                                   buffer: buffer)
        }
        
        operationsQueue.append(operation)
    }
    
    open func build(inputData: Any? = nil, result: CompoundOperationResult? = nil) -> AsyncCompoundOperation {
        let compoundOperation = buildCompoundOperation()
        compoundOperation.queueInput?.setOperationQueue(inputData: inputData)
        compoundOperation.result = result
        
        return compoundOperation
    }
    
    // MARK: - Private methods
    
    private func buildCompoundOperation() -> AsyncCompoundOperation {
        let compoundOperation = AsyncCompoundOperation()
        compoundOperation.maxConcurrentOperationsCount = 1
        
        OperationChainer.chain(compoundOperation: compoundOperation,
                               with: operationsQueue)
        
        for operation in operationsQueue {
            compoundOperation.addOperation(operation)
        }
        
        return compoundOperation
    }
}
