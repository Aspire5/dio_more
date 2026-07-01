import '../features/registry/registry.dart';

/// Feature identifiers to toggle specific plugin sets.
class StudioFeature {
  /// Create a new [StudioFeature] with target [id].
  const StudioFeature(this.id);

  /// Unique identifier of the feature module.
  final String id;
}

/// Namespace container for core features.
abstract final class StudioFeatures {
  /// Mocking features identifier.
  static const mock = StudioFeature('core.mock');

  /// Recording/replay features identifier.
  static const record = StudioFeature('core.record');

  /// Latency/error simulation features identifier.
  static const network = StudioFeature('core.network');

  /// Request inspection features identifier.
  static const inspector = StudioFeature('core.inspector');
}

class DioStudioConfig {
  /// Create a new [DioStudioConfig] options instance.
  const DioStudioConfig({
    this.enabled = true,
    this.enabledFeatures = const {},
    this.registry,
  });

  /// Master switch indicating if the developer studio is active.
  final bool enabled;

  /// Active feature set to tree-shake or toggle capabilities at startup.
  final Set<StudioFeature> enabledFeatures;

  /// The compile-time safe URL registry.
  final ApiRegistry? registry;

  /// Creates a copy of this config with the given fields replaced.
  DioStudioConfig copyWith({
    bool? enabled,
    Set<StudioFeature>? enabledFeatures,
    ApiRegistry? registry,
  }) {
    return DioStudioConfig(
      enabled: enabled ?? this.enabled,
      enabledFeatures: enabledFeatures ?? this.enabledFeatures,
      registry: registry ?? this.registry,
    );
  }
}
