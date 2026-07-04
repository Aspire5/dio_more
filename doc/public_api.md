# Public API

This document tracks all public-facing APIs exported from `lib/dio_more.dart`.

Every addition, modification, or removal of a public API must be reflected here.

## Exported Classes

| Class | Purpose |
| ----- | ------- |
| `DioStudio` | Main controller for attaching and configuring developer features. |
| `DioStudioConfig` | Immutable configuration options container. |
| `Logging` | Immutable logging configuration presets (all, errorsOnly, none). |
| `ApiRegistry` | Immutable API configurations lookup registry. |
| `ApiRegistryBuilder` | Fluent builder to configure environments, services, and endpoints. |

## Exported Extensions

| Extension | Target | Purpose |
| --------- | ------ | ------- |
| `DioStudioExtension` | `Dio` | Attaches `.studio` property and `.enableStudio()` initializer. |
| `OptionsStudioExtension` | `Options` | Adds `.withPathParams()` helper to define request path parameters. |

## Exported Types

| Type | Target | Purpose |
| ---- | ------ | ------- |
| `EndpointId` | `extension type` | Strongly typed endpoint business identifier representation. |
| `EnvironmentId` | `extension type` | Strongly typed environment configuration identifier representation. |
| `ServiceId` | `extension type` | Strongly typed service path prefix identifier representation. |

## Deprecated APIs

_None._

---

Last updated: 2026-07-04

