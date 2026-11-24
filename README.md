# Python Project Template

A general-purpose Python project template that I maintain for my personal projects. Anyone is welcome to use, modify, or extend it.

The template provides a standard project structure, local and containerized development environments, dependency management, testing, and code quality tooling without introducing application-specific dependencies or architectural constraints.

It is IDE-independent but primarily configured for Visual Studio Code.

Nothing in this template is mandatory. The structure, tooling, configurations, and development workflows reflect my personal preferences and are subject to change depending on individual project requirements. Components can be modified, replaced, or removed as needed. The template is intended as a starting point, not a prescribed development standard.

## Development Environment

### Local Development

Requirements:

- Python 3.11
- Bash
- Git

From the project root:

```bash
bash scripts/install_development_environment.sh
```

The script validates the Python version, creates or reuses the `.venv` environment, upgrades pip, and installs dependencies from `requirements.txt`.

Activate the environment:

```bash
source .venv/bin/activate
```

### Containerized Development

Requirements:

- Docker
- Docker Compose

The development image is based on Ubuntu 24.04 and includes Python 3.11, pip, uv, system development tools, and a non-root user with passwordless sudo privileges.

Start the development container:

```bash
docker compose -f docker-compose.dev.yml up -d --build dev
```

Access the container:

```bash
docker compose -f docker-compose.dev.yml exec dev bash
```

Stop the development container:

```bash
docker compose -f docker-compose.dev.yml down
```

The project directory is bind-mounted to `/workspace`. Package manager and pre-commit caches are persisted through Docker volumes.

The Dockerfile defines the development environment only. Production images and deployment configurations are left to individual projects.

## Visual Studio Code

The `.vscode/` and `.devcontainer/` directories provide development environment integration, interpreter configuration, debugging, and task automation.

Available tasks:

| Task | Description |
|---|---|
| Setup: Install Development Environment | Initialize the local virtual environment |
| Development: Start Development Container | Build and start the development container |
| Development: Open in Development Container | Open the containerized workspace |
| Development: Stop Development Container | Stop the development container |
| Test: Run All Tests | Execute all tests |
| Test: Run Unit Tests | Execute unit tests |
| Test: Run Integration Tests | Execute integration tests |
| Quality: Run Pre-commit | Execute all configured Git hooks |

Tasks are accessible through `Tasks: Run Task` in the command palette.

Launch configurations are provided for the application entry point, CLI, testing, and pre-commit. Python-related tasks and launch configurations use the selected interpreter.

VS Code integration is optional. All underlying tools can be used directly from the terminal or another IDE.

## Tooling

| Tool | Purpose |
|---|---|
| pip / uv | Dependency management |
| Fire | Command-line interface |
| Black | Code formatting |
| Ruff | Linting and import sorting |
| Mypy | Static type checking |
| unittest | Unit and integration testing |
| Coverage | Test coverage |
| pre-commit | Automated code quality checks |

Tooling configurations are centralized in `pyproject.toml`, with dependencies defined in `requirements.txt`.

## Usage

Create a repository using the GitHub template, select a development environment, and extend the project as needed.

Application frameworks, external services, infrastructure, and production deployment strategies are intentionally outside the scope of this template.

# Project Name

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

## Contents

1. [Introduction](#1-introduction)
2. [Installation](#2-installation)
3. [Quick Usage](#3-quick-usage)
4. [Detailed Usage](#4-detailed-usage)
5. [Architecture](#5-architecture)
6. [Diagrams](#6-diagrams)
7. [Design Choices](#7-design-choices)
8. [Capabilities](#8-capabilities)
9. [Troubleshooting](#9-troubleshooting)
10. [Code Quality](#10-code-quality)
11. [Tests](#11-tests)

## 1. Introduction

### 1.1 Problem Statement

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 1.2 Proposed Solution

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 1.3 Technology Stack

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 1.4 Terminology

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

## 2. Installation

### 2.1 Prerequisites

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 2.2 Repository Setup

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 2.3 Local Development Environment

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 2.4 Containerized Development Environment

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 2.5 Dependencies

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 2.6 Runtime Assets

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

## 3. Quick Usage

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

## 4. Detailed Usage

### 4.1 Configuration

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 4.2 Environment Variables

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 4.3 Terminal Execution

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 4.4 Command-Line Interface

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 4.5 VS Code Debugging (`launch.json`)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 4.6 VS Code Tasks (`tasks.json`)

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 4.7 Development Container

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 4.8 Production and Deployment

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

## 5. Architecture

### 5.1 System Overview

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 5.2 Project Structure

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 5.3 Components and Responsibilities

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 5.4 Execution Flow

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 5.5 Data Flow

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

## 6. Diagrams

### 6.1 System Architecture Diagram

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 6.2 Component Diagram

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 6.3 Sequence Diagram

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

## 7. Design Choices

### 7.1 Architectural Decisions

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 7.2 Technology Selection

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 7.3 Trade-offs and Limitations

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

## 8. Capabilities

### 8.1 Supported Features

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 8.2 Known Limitations

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

## 9. Troubleshooting

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

## 10. Code Quality

### 10.1 Coding Standards

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 10.2 Formatting and Linting

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 10.3 Static Type Checking

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 10.4 Pre-commit Hooks

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

## 11. Tests

### 11.1 Testing Strategy

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 11.2 Unit Tests

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 11.3 Integration Tests

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.

### 11.4 Test Coverage

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
