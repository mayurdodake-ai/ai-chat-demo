//
//  Models.swift
//  AIChatDemo
//
//  Created by Mayur on 14/09/25.
//

import Foundation

struct ChatMessagePayload: Codable {
    let role: String
    let content: String
}

struct OpenAIResponse: Codable {
    struct Choice: Codable {
        struct Message: Codable {
            let role: String
            let content: String
        }
        let message: Message
    }
    let choices: [Choice]
}
