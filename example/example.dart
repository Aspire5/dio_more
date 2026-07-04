import 'package:dio_more/dio_more.dart';

// 1. Define logical Endpoint IDs using Dart 3.3 Extension Types.
// These compile down to zero-allocation primitive Strings.
const getPackage = EndpointId('pub.get_package');
const getAd = EndpointId('pub.get_ad');

void main() async {
  // 2. Build the ApiRegistry mapping environments and services.
  final registry = ApiRegistry.builder()
      .environment(EnvironmentId.production, baseUrl: 'https://pub.dev')
      .service(const ServiceId('pub_api'), path: '/api')
      .endpoint(
        id: getPackage,
        path: '/packages/:name',
        service: const ServiceId('pub_api'),
        timeout: const Duration(seconds: 5),
      )
      .endpoint(
        id: getAd,
        path: '/ad-details',
        service: const ServiceId('pub_api'),
      )
      .build(EnvironmentId.production);

  // 3. Initialize Dio and enable dio_more.
  // We attach the registry and restrict active console logging to getPackage.
  final dio = Dio()..enableStudio(registry: registry, logOnly: {getPackage});

  print('--- Executing getPackage (in logOnly focus set -> LOGGED) ---');
  try {
    // 4. Fire request using the EndpointId and Options.withPathParams extension.
    await dio.get(
      'pub.get_package',
      options: Options().withPathParams({'name': 'dio_more'}),
    );
  } catch (e) {
    // Expected to complete successfully or throw on connection/network issues.
    print('Request complete (details logged above).');
  }

  print('\n--- Executing getAd (NOT in logOnly focus set -> SILENCED) ---');
  try {
    // This request runs normally, but its logging is suppressed because it's not in logOnly.
    await dio.get('pub.get_ad');
  } catch (e) {
    // Silenced request error detail
    print('Request complete (logs were suppressed).');
  }
}
