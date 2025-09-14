//
//  ChatViewModel.swift
//  AIChatDemo
//
//  Created by Mayur on 15/09/25.
//

import Foundation

@MainActor
class ChatViewModel: ObservableObject {
    struct Message: Identifiable {
        let id = UUID()
        let role: String
        let content: String
    }

    @Published var messages: [Message] = []
    @Published var input = ""
    @Published var isSending = false

    private let service = ChatService()

    func send() {
        let text = input.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !text.isEmpty else { return }
        input = ""

        let userMsg = Message(role: "user", content: text)
        messages.append(userMsg)

        Task {
            isSending = true
            let payloads = messages.map { ChatMessagePayload(role: $0.role, content: $0.content) }
            do {
                let reply = try await service.send(messages: payloads)
                let botMsg = Message(role: "assistant", content: reply)
                messages.append(botMsg)
            } catch {
                let errMsg = Message(role: "assistant", content: "Error: \(error.localizedDescription)")
                messages.append(errMsg)
            }
            isSending = false
        }
    }
}
