# 01-API-NETWORKING

A Swift-based networking project focused on building a **production-style API layer**, secure configuration system, and scalable MVVM architecture using a mock backend.

---

# Overview

This project demonstrates how to design and implement a real-world iOS networking system using:

* Environment-based configuration (`.xcconfig`)
* Build configuration separation (Debug / Release)
* Secure API key injection via Xcode build system
* Centralized config access layer (`AppConfig`)
* REST API integration using a mock backend
* MVVM architecture (Models, ViewModels, Views)
* Token-based authentication concepts
* Keychain security principles (design-level)

The goal of this project is to move beyond basic API calls and simulate a **real production-grade app architecture**.

---

# Key Learning Outcomes

## Environment Configuration (.xcconfig)

Implemented environment-specific configuration using `.xcconfig` files.

### Files:

```
Config.xcconfig
```

### Example:

```
API_KEY = your_api_key_here
```
---

### Security & Git Hygiene

.xcconfig files containing sensitive values are excluded from version control using .gitignore to prevent leaking secrets into the repository.

This ensures:

API keys are not committed to Git
Environment secrets stay local
Production credentials are protected

---

## Project Configuration (Debug / Release)

Configured build environments inside Xcode:

```
Project → Info → Configurations
```

| Configuration | File             |
| ------------- | ---------------- |
| Debug         | Config.xcconfig  |
| Release       | Config.xcconfig  |

---

## Custom iOS Target Properties (Info.plist Injection)

Environment variables are injected into runtime via:

```
Target → Info → Custom iOS Target Properties
```

Example:

```
API_KEY = $(API_KEY)
```

---

## AppConfig Layer (Centralized Access)

Created a single source of truth for all environment values:

```swift
import Foundation

enum AppConfig {
    static var apiKey: String {
        Bundle.main.object(forInfoDictionaryKey: "API_KEY") as? String ?? ""
    }
}
```

This avoids hardcoding and centralizes configuration access.

---

## Networking Layer

Built a reusable networking system for REST API communication.

### Key features:

* GET / POST / PUT / DELETE support
* JSON decoding using `Codable`
* Async request handling
* Error handling abstraction
* Scalable API client design

---

## Mock API Used

Used a fake REST API service for testing:

ReqRes (mock REST API)

Practiced:

Fetching user lists
Login simulation
Creating and deleting users (mock behavior)
Full CRUD request flow

---

## Security & Token Concept

Introduced foundational authentication architecture:

* Token-based session flow
* Token lifecycle concept (login → store → reuse)
* Keychain-based storage design (conceptual)

```swift
// Conceptual layer
TokenManager / KeychainService
```

---

## Architecture (MVVM)

Structured the app using MVVM for scalability:

### Models

* Codable API response models

### ViewModels

* Business logic layer
* API calls
* UI state management

### Views

* SwiftUI views
* Reactive UI updates

---


---

## 📁 Project Structure

```
01-API-NETWORKING
│
├── Config
├── Model
├── Networking
├── Security
├── View
├── ViewModel
├── _1_API_NetworkingApp.swift
├── Assets
└── Config.xcconfig
```

---

# Security Practices

* No hardcoded API keys in source code
* Environment-based configuration system
* Build-time injection using `.xcconfig`
* Designed Keychain-based token storage layer
* Separation of config, networking, and UI layers

---

# Key Takeaways

* Built a production-style networking architecture
* Learned environment-based configuration using `.xcconfig`
* Understood Debug vs Release build separation
* Implemented centralized configuration management
* Practiced MVVM architecture in a real API-driven app
* Simulated backend communication using a mock API system
* Designed secure token handling concepts

---

# Summary

This project represents a transition from basic API usage to a **structured, scalable, and production-style iOS networking architecture**, incorporating environment management, security principles, and MVVM design patterns.
