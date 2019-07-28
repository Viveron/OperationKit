//
//  ChainableOperationOutput.swift
//  OperationKit
//
//  Created by Victor Shabanov on 26/07/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

public protocol ChainableOperationOutput: class {
    
    func didCompleteChainableOperation(outputData: Any?)
}
