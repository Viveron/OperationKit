//
//  OperationScheduler.swift
//  OperationKit
//
//  Created by Victor Shabanov on 26/07/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

open class OperationScheduler {
    
    private let queue: OperationQueue
    
    public init() {
        queue = OperationQueue()
        queue.name = .uniqueQueueName()
        queue.maxConcurrentOperationCount = OperationQueue.defaultMaxConcurrentOperationCount
    }
    
    open func addOperation(_ operation: Operation) {
        queue.addOperation(operation)
    }
}
