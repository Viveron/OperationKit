//
//  ChainableOperation.swift
//  OperationKit
//
//  Created by Victor Shabanov on 26/07/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

public protocol ChainableOperation: class {
    
    var input: ChainableOperationInput? { get set }

    var output: ChainableOperationOutput? { get set }
    
    var delegate: ChainableOperationDelegate? { get set }
}
