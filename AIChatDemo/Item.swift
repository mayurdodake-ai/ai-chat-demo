//
//  Item.swift
//  AIChatDemo
//
//  Created by GuestAccount on 14/09/25.
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
