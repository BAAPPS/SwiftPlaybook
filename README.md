# SwiftPlaybook

A Swift & SwiftUI learning system built around **MVVM architecture**.
Each module isolates a single iOS concept and implements it in a **reusable, production-style structure**.

This is not a collection of tutorials—it is a **modular architecture practice system** for building real-world iOS thinking.

---

## Core Philosophy

Instead of learning Swift as isolated topics, this repo treats each concept as a **system module**:

> One concept → One MVVM implementation → One reusable pattern

Each module is designed to be:

* Reusable in real apps
* Architecturally clean (MVVM-first)
* Closely aligned with production iOS development
* Easy to revisit when building new features

---

## Architecture Standard (MVVM)

Every module follows the same structure:

```
View → ViewModel → Model
        ↓
   Networking / Services
```

### Responsibilities:

* **View (SwiftUI):** UI only, no business logic
* **ViewModel:** State + business logic + data transformation
* **Model:** Data structures (Codable where needed)
* **Services:** Networking / persistence / external interactions

---

## Modules

Each folder represents one isolated concept:

### 01 - API Networking & Codable

* URLSession + async/await
* JSON decoding with Codable
* Generic API client
* MVVM data flow

---

### (More modules coming)

Planned additions:

* State Management (Published / ObservedObject / StateObject)
* Search & Filtering Logic
* Pagination & Infinite Scroll
* Caching Strategies
* Error Handling Patterns
* SwiftData Persistence
* Authentication Flow Design

---

## Project Structure

Each module follows this consistent layout:

```
ModuleName/
│
├── App/            # Entry point (SwiftUI App)
├── View/           # UI Layer
├── ViewModel/      # State + Logic
├── Model/          # Data structures
├── Networking/     # API / services (if needed)
└── Notes/          # Learning notes + insights
```

---

## Goals of This Repo

This repository is designed to help:

* Build **real-world iOS architecture intuition**
* Understand how MVVM scales across features
* Turn isolated concepts into reusable systems
* Bridge the gap between learning Swift and building production apps

---

## How to Use This Repo

You should NOT just browse it.

Instead:

1. Pick a concept (e.g. API Networking)
2. Rebuild it from scratch
3. Modify it for a real app use-case
4. Reuse the pattern in future projects

---

## Why This Exists

Most Swift learning is fragmented:

* Tutorials are isolated
* Concepts are not reusable
* Architecture is not emphasized

This repo solves that by building a **repeatable system for learning Swift like an engineer, not a viewer**.

---

## Future Vision

This SwiftPlaybook will evolve into:

* A personal iOS architecture library
* A reusable blueprint for all future apps
* A reference system for production SwiftUI development

---

## Tech Stack

* Swift 6+
* SwiftUI
* MVVM Architecture
* async/await networking
* Codable JSON parsing

---

