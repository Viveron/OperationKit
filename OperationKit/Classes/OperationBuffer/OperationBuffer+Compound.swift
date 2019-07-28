//
//  OperationBuffer+Compound.swift
//  OperationKit
//
//  Created by Victor Shabanov on 26/07/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

// MARK: - CompoundOperationQueueInput
extension OperationBuffer: CompoundOperationQueueInput {
    
    public func setOperationQueue(inputData: Any?) {
        buffer = inputData
    }
}

// MARK: - CompoundOperationQueueOutput
extension OperationBuffer: CompoundOperationQueueOutput {
    
    public func obtainOperationQueueOutputData() -> Any? {
        return buffer
    }
}
