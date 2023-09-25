//
//  Item.swift
//  testFramework
//
//  Created by Tomas Kafka on 25.09.2023.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
