//
//  ContentView.swift
//  AIChatDemo
//
//  Created by GuestAccount on 14/09/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ChatViewModel()

    var body: some View {
        VStack {
            ScrollView {
                ForEach(vm.messages) { m in
                    HStack {
                        if m.role == "assistant" { Spacer() }
                        Text(m.content)
                            .padding()
                            .background(m.role == "user" ? Color.blue.opacity(0.2) : Color.gray.opacity(0.2))
                            .cornerRadius(10)
                            .frame(maxWidth: 250, alignment: .leading)
                        if m.role == "user" { Spacer() }
                    }
                    .padding(4)
                }
            }

            HStack {
                TextField("Type a message...", text: $vm.input)
                    .textFieldStyle(.roundedBorder)
                Button(action: vm.send) {
                    if vm.isSending { ProgressView() } else { Text("Send") }
                }
                .disabled(vm.isSending)
            }
            .padding()
        }
        .navigationTitle("AI Chat Demo")
    }
}

