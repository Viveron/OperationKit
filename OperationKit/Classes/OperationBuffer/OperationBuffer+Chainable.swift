//
//  OperationBuffer+Chainable.swift
//  OperationKit
//
//  Created by Victor Shabanov on 26/07/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

// MARK: - ChainableOperationInput
extension OperationBuffer: ChainableOperationInput {
    
    public func obtainChainableOperationInputData() -> Any? {
        return buffer
    }
}

// MARK: - ChainableOperationOutput
extension OperationBuffer: ChainableOperationOutput {
    
    public func didCompleteChainableOperation(outputData: Any?) {
        buffer = outputData
    }
}
