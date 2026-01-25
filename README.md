# Turn-Based Strategy Board Game Adaptation (Godot 4)

A personal portfolio project implemented in Godot 4, focused on clean architecture, data-driven design, and maintainable game systems rather than visual polish.

The project is inspired by a complex asymmetrical board game and serves as a demonstration of gameplay systems, state management, and UI architecture suitable for complex turn-based games.

## Project Goals

This project was created to demonstrate:

- Clean separation of game state, logic, and UI
- A reversible action system (undo / replay / save-ready)
- Data-driven design using Godot Resources
- Scalable UI architecture driven by signals
- Thoughtful use of Godot 4 features and statically typed GDScript

## Architecture Overview

The codebase is organized around a clear architectural split:

### Data

Static game definitions (regions, pieces, nations, political tracks) stored as resources.

### State

Mutable runtime state representing the current game (regions, pieces, nations).

### Logic

Rule evaluation and legality checks (e.g. movement rules, political rules).

#### Actions

All game mutations are performed through reversible actions implementing:
- apply()
- undo()
- can_apply()

### Controller

Interprets UI intent signals and applies valid actions to the game state.

### UI

Pure visualization and input handling, reacting to state changes via signals and never mutating game state directly.

This architecture allows deterministic gameplay, undo/redo support, and replayable action history.

## Key Features

### Reversible action system

All gameplay changes are performed through undoable actions, enabling undo/redo, deterministic replays, and future save/load support.

### Data-driven game content

Static game definitions (region, pieces, nations) are separated from runtime state and defined via resources, making the game easy to extend and rebalance.

### Reactive UI architecture

The UI is fully decoupled from game logic and updates automatically in response to state changes via signals.

### Scalable map and region representation

Regions track piece presence and derived state (such as army ownership) without embedding rule logic, allowing complex interactions to emerge from simple data.

### Clear separation of responsibilities

Game state, rules, actions, UI, and control flow are isolated into distinct layers for long-term maintainability.

## Technical Highlights

- Godot 4
- GDScript with static typing
- Signal-based UI architecture
- Command pattern (Game Actions)
- Resource-driven data design
- Deterministic game state and undo support

## Project Status

The project is under active development. Current focus areas include:
- Army movement
- Battles
- Recruiting units
- Sieges
- Nation mechanics
