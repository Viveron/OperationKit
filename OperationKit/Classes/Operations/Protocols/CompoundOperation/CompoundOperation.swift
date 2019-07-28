//
//  CompoundOperation.swift
//  OperationKit
//
//  Created by Victor Shabanov on 26/07/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

public typealias CompoundOperationResult = (_ data: Any?, _ error: Error?) -> Void

public protocol CompoundOperation: class {
    
    var maxConcurrentOperationsCount: Int { set get }
    
    var result: CompoundOperationResult? { set get }
    
    var queueInput: CompoundOperationQueueInput? { set get }
    
    var queueOutput: CompoundOperationQueueOutput? { set get }
    
    func addOperation(_ operation: Operation & ChainableOperation)
}
