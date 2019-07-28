//
//  ChainableOperationError.swift
//  OperationKit
//
//  Created by Victor Shabanov on 28/07/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

public enum ChainableOperationError: Error {
    
    // Missing or invalud input data of ChainableOperation
    case invalidInputData
    
    // ChainableOperation was completed with no data
    case emptyResultData
}
