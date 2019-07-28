//
//  AsyncOperation.swift
//  OperationKit
//
//  Created by Victor Shabanov on 26/07/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

public extension AsyncOperation {
    
    enum State: String {
        case isReady
        case isExecuting
        case isFinished
    }
}

open class AsyncOperation: Operation {
    
    var state: State = .isReady {
        willSet {
            willChangeValue(forKey: state.rawValue)
            willChangeValue(forKey: newValue.rawValue)
        }
        didSet {
            didChangeValue(forKey: oldValue.rawValue)
            didChangeValue(forKey: state.rawValue)
        }
    }
    
    open override var isAsynchronous: Bool {
        return true
    }
    
    open override var isExecuting: Bool {
        return state == .isExecuting
    }
    
    open override var isFinished: Bool {
        return state == .isFinished
    }
    
    open override func start() {
        guard !isCancelled else {
            state = .isFinished
            return
        }
        
        Thread.detachNewThreadSelector(#selector(main), toTarget: self, with: nil)
        state = .isExecuting
    }
    
    open override func main() {
        
    }
    
    open func complete() {
        state = .isFinished
    }
}
