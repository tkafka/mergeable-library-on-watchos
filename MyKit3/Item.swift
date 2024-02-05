//
//  Item.swift
//  testFramework
//
//  Created by Tomas Kafka on 25.09.2023.
//

import Foundation
import SwiftData

@Model
public final class Item {
    var timestamp: Date
    
    public init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
