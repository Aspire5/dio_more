# Changelog

All notable changes to dio_studio are documented in this file.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
This project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [0.0.2] - 2026-07-01

### Added
- Immutable `ApiRegistry` and `ApiRegistryBuilder` supporting environment management, multiple services with base URL prefixing, and pre-compiled endpoint path template segments.
- Compile-time safe identifier extension types: `EnvironmentId`, `ServiceId`, and `EndpointId`.
- Options extension helper method `Options.withPathParams()` for cleanly passing path parameter arguments.
- Core interceptor plugin (`ApiRegistryPlugin`) delivering O(1) direct map lookup resolution.
- Plugin Integration Contract to attach compiled metadata configurations directly to `RequestOptions.extra`.

## [0.0.1] - 2026-06-30

### Added
- Project documentation system (`docs/` directory) with architecture, decisions, roadmap, coding guidelines, plugin design, and development log.
- AI collaboration rules (`.agents/AGENTS.md`) for consistent development across sessions.
- Architectural decision records (ADR-001 through ADR-004) establishing core design principles.
- Project README with goals, design principles, and documentation links.
- Initial `lib/src/` directory structure.
- Feature roadmap with planned features.

## [0.0.1] - 2026-06-30

### Added
- Initial project scaffold.
