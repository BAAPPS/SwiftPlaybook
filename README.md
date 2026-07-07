# SwiftPlaybook

A Swift & SwiftUI learning system focused on building **production-style iOS development patterns** through modular MVVM implementations.

This repository is not a collection of tutorials or isolated experiments.

Each module takes a single iOS concept, applies it to a real-world scenario, and turns it into a reusable architecture pattern.

---

## Core Philosophy

Instead of memorizing Swift and SwiftUI APIs individually, this repo focuses on learning through systems:

> One concept → One real-world implementation → One reusable pattern

Each module is designed to:

- Build practical iOS architecture intuition
- Follow production-style MVVM patterns
- Isolate and master individual concepts
- Create reusable solutions for future applications

---

## Architecture Standard (MVVM)

Every module follows the same architectural structure:

```
             Services
                |
                ↓

View  →  ViewModel  →  Model
|
↓
State

```

### Responsibilities

### View (SwiftUI)
- Responsible only for UI rendering
- Displays state from the ViewModel
- Handles user interaction events

### ViewModel
- Owns screen state
- Contains business logic
- Coordinates data flow between services and views

### Model
- Represents application data
- Handles Codable/API response structures when needed

### Services
- Networking
- Persistence
- External integrations
- System interactions

---

# Modules

Each module focuses on one concept and applies it through a reusable MVVM implementation.

---

## 01 - API Networking & Codable

Foundation networking patterns.

Implemented concepts:

- URLSession with async/await
- Codable JSON parsing
- Generic API client
- API request lifecycle
- MVVM data flow

---

## 02 - API Networking & NewsAPI

Building real-world API features on top of networking fundamentals.

Implemented concepts:

- External API integration
- Decodable response modeling
- Query parameter handling
- Search functionality
- MVVM feature structure
- Async image loading

---

## 03 - API Networking & TMDB Discovery

Applying networking patterns to a movie discovery application.

Implemented concepts:

- TMDB API endpoint integration
- Generic paginated responses
- Infinite scrolling pagination
- Async image loading
- Movie list and detail navigation
- MVVM state management

---

## Future Modules

Planned concepts:

- State Management
    - @State
    - @Binding
    - @Observable
    - ObservableObject patterns

- Search & Filtering Systems

- Advanced Pagination Patterns

- Caching Strategies

- Error Handling Architectures

- SwiftData Persistence

- Authentication Flow Design

- Dependency Injection

---

# Learning Approach

This repository is designed for active learning.

Do not simply browse the modules.

The intended workflow:

1. Choose a concept
2. Rebuild the implementation from scratch
3. Understand the architectural decisions
4. Modify it for a different real-world scenario
5. Reuse the pattern in future applications

The goal is not to memorize code.

The goal is to build engineering intuition.

---

# Why This Exists

Many Swift learning resources teach concepts in isolation:

- APIs without architecture
- SwiftUI without state management
- Features without reusable patterns

SwiftPlaybook bridges that gap by turning individual concepts into complete, repeatable systems.

---

# Future Vision

SwiftPlaybook will evolve into:

- A personal iOS architecture reference
- A reusable blueprint for future applications
- A collection of production-inspired SwiftUI patterns

---

# Tech Stack

- Swift 6+
- SwiftUI
- MVVM Architecture
- async/await Concurrency
- Codable JSON Parsing
- URLSession Networking
- SwiftData (future modules)
