# AI Chat Demo 🤖📱

A simple **iOS ChatGPT client** with a **Node.js backend proxy**, built for my AI/ML career portfolio.  
This app demonstrates how to integrate **OpenAI GPT models** into a native iOS SwiftUI app.

---

## ✨ Features
- Chat with OpenAI GPT models in a clean SwiftUI interface  
- Backend proxy (Node/Express) for secure API key handling  
- Safe API key management (not hardcoded in the app)  
- Ready for deployment (works with ngrok / cloud hosting)  

---

## 🛠️ Tech Stack
- **iOS App**: SwiftUI, Combine, URLSession  
- **Backend**: Node.js, Express  
- **AI**: OpenAI GPT (chat completions)  
- **Version Control**: Git + GitHub  

---

## 📂 Project Structure
ai-chat-demo/
├── AIChatDemo/ # iOS SwiftUI project
├── AIChatDemoTests/ # Unit tests
├── AIChatDemoUITests/ # UI tests
├── server/ # Node/Express backend
├── .gitignore
└── README.md

## Setup Backend
cd server
npm install

## Export your API key (Mac/Linux):
export OPENAI_API_KEY="your_api_key_here"

## Run the server:
node server.js

## Your backend runs at:
http://localhost:3000/chat
(If testing on a real iPhone, expose it using ngrok http 3000.)

##  Setup iOS App
Open AIChatDemo.xcodeproj in Xcode

## Update the backend URL in ChatService.swift:
let backendURL = URL(string: "http://localhost:3000/chat")!
(replace with your ngrok URL if testing on device)
Build & Run → Simulator or device

## 📌 Notes
API key is never stored in the iOS app — only on backend.
Backend can be deployed to Heroku, Vercel, or Render for production.

## 🧑‍💻 Author
Mayur Dodake

## Portfolio Website
https://mayurdodake.github.io

## ⭐ Message
This project was built as part of my AI/ML career journey.
Feel free to fork, learn, or showcase similar integrations in your own work!

