//
//  AsyncCompoundOperation.swift
//  OperationKit
//
//  Created by Victor Shabanov on 26/07/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

open class AsyncCompoundOperation: AsyncOperation, CompoundOperation, CancelableOperation, ChainableOperationDelegate {
    
    private let queue: OperationQueue
    
    open var maxConcurrentOperationsCount: Int = 1 {
        willSet {
            if maxConcurrentOperationsCount != newValue {
                queue.maxConcurrentOperationCount = newValue
            }
        }
    }
    
    open var result: CompoundOperationResult?
    open var queueInput: CompoundOperationQueueInput?
    open var queueOutput: CompoundOperationQueueOutput?
    
    public override init() {
        queue = OperationQueue()
        queue.name = .uniqueQueueName(isAsyncQueue: true)
        queue.maxConcurrentOperationCount = maxConcurrentOperationsCount
        queue.isSuspended = true
        
        super.init()
    }
    
    open override func main() {
        queue.isSuspended = false
    }
    
    open override func cancel() {
        super.cancel()
        
        completeOperation()
    }
    
    open func addOperation(_ operation: Operation & ChainableOperation) {
        queue.addOperation(operation)
        operation.delegate = self
    }
    
    open func completeOperation(data: Any? = nil, error: Error? = nil) {
        queue.isSuspended = true
        queue.cancelAllOperations()
        complete()
        
        result?(data, error)
    }
    
    // MARK: - ChainableOperationDelegate
    
    open func didCompleteChainableOperation(error: Error?) {
        let data = queueOutput?.obtainOperationQueueOutputData()
        
        if data != nil || error != nil {
            completeOperation(data: data, error: error)
        }
    }
}
