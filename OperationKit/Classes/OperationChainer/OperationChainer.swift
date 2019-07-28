//
//  OperationChainer.swift
//  OperationKit
//
//  Created by Victor Shabanov on 26/07/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

open class OperationChainer {
    
    static func chain(parentOperation: Operation & ChainableOperation,
                      childOperation: Operation & ChainableOperation,
                      buffer: OperationBuffer) {
        
        childOperation.addDependency(parentOperation)
        
        parentOperation.output = buffer
        childOperation.input = buffer
    }
    
    static func chain(compoundOperation: AsyncCompoundOperation,
                      with opearionsQueue: [Operation & ChainableOperation]) {
        guard opearionsQueue.count > 0 else {
            return
        }
        
        let firstOperation = opearionsQueue.first!
        let firstBuffer = OperationBuffer()
        firstOperation.input = firstBuffer
        compoundOperation.queueInput = firstBuffer
        
        let lastOperation = opearionsQueue.last!
        let lastBuffer = OperationBuffer()
        lastOperation.output = lastBuffer
        compoundOperation.queueOutput = lastBuffer
    }
}
