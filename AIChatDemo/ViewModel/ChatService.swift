//
//  ChatService.swift
//  AIChatDemo
//
//  Created by Mayur on 15/09/25.
//

import Foundation

actor ChatService {

    let backendURL = URL(string: "https://a1b2c3d4.ngrok.io/chat")!

    func send(messages: [ChatMessagePayload]) async throws -> String {
        var req = URLRequest(url: backendURL)
        req.httpMethod = "POST"
        req.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body = ["messages": messages]
        req.httpBody = try JSONEncoder().encode(body)

        let (data, response) = try await URLSession.shared.data(for: req)
        guard let http = response as? HTTPURLResponse, 200..<300 ~= http.statusCode else {
            throw URLError(.badServerResponse)
        }

        let decoded = try JSONDecoder().decode(OpenAIResponse.self, from: data)
        return decoded.choices.first?.message.content ?? ""
    }
}
