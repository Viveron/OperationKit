//
//  String+UniqueQueueName.swift
//  OperationKit
//
//  Created by Victor Shabanov on 26/07/2019.
//  Copyright © 2019 Victor Shabanov. All rights reserved.
//

import Foundation

internal extension String {
    
    static func uniqueQueueName(isAsyncQueue: Bool = false) -> String {
        let bundleIdentifier = Bundle.main.bundleIdentifier ?? "com.operation.kit"
        return bundleIdentifier + (isAsyncQueue ? ".async-" : "-") + UUID().uuidString + ".queue"
    }
}
