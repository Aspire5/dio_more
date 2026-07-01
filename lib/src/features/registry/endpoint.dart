import 'registry.dart';

/// Static identity representing an API endpoint.
///
/// Under the hood, this compiles to a primitive [String] with zero runtime allocations.
extension type const EndpointId(String value) implements String {}

/// Immutable compiled definition of an API endpoint configuration.
///
/// Exposed via the Plugin API to inspect endpoint metadata.
class EndpointDefinition {
  /// Create a new [EndpointDefinition] container.
  EndpointDefinition({
    required this.id,
    required this.pathTemplate,
    required this.service,
    this.timeout,
    this.requiresAuthentication = false,
    this.defaultHeaders,
  }) : compiledSegments = _compilePathTemplate(pathTemplate);

  /// Unique business identity for the endpoint.
  final EndpointId id;

  /// Raw path template (e.g. `'/profile/:id'`).
  final String pathTemplate;

  /// The service identifier this endpoint belongs to.
  final ServiceId service;

  /// Custom request timeout for this endpoint.
  final Duration? timeout;

  /// Indicates if this endpoint requires authentication.
  final bool requiresAuthentication;

  /// Default headers to apply for this endpoint.
  final Map<String, String>? defaultHeaders;

  /// Pre-compiled path template segments used for O(1) runtime url resolution.
  final List<PathSegment> compiledSegments;

  static List<PathSegment> _compilePathTemplate(String pathTemplate) {
    final List<PathSegment> segments = [];
    final RegExp paramRegExp = RegExp(r':([a-zA-Z0-9_]+)');
    int lastMatchEnd = 0;

    for (final Match match in paramRegExp.allMatches(pathTemplate)) {
      if (match.start > lastMatchEnd) {
        segments.add(LiteralSegment(pathTemplate.substring(lastMatchEnd, match.start)));
      }
      segments.add(ParamSegment(match.group(1)!));
      lastMatchEnd = match.end;
    }

    if (lastMatchEnd < pathTemplate.length) {
      segments.add(LiteralSegment(pathTemplate.substring(lastMatchEnd)));
    }

    return List.unmodifiable(segments);
  }
}

/// Abstract representation of a path template fragment.
sealed class PathSegment {
  const PathSegment();
}

/// Literal string fragment of a URL path.
class LiteralSegment extends PathSegment {
  /// Create a [LiteralSegment] with [text].
  const LiteralSegment(this.text);

  /// Literal URL segment text.
  final String text;

  @override
  String toString() => 'LiteralSegment("$text")';
}

/// Placeheaded dynamic fragment of a URL path.
class ParamSegment extends PathSegment {
  /// Create a [ParamSegment] with dynamic parameter key [name].
  const ParamSegment(this.name);

  /// Key name of the dynamic parameter placeholder.
  final String name;

  @override
  String toString() => 'ParamSegment(":$name")';
}
