import 'package:dio_studio/dio_studio.dart';

void main() async {
  // Create a standard Dio client
  final dio = Dio();

  // ignore: avoid_print
  print('=== Initializing dio_studio example ===');

  // Initialize and enable studio with default logging presets
  dio.enableStudio();

  // Make a request to verify visual logging works
  try {
    // ignore: avoid_print
    print('\nMaking test request...');
    await dio.get('https://pub.dev/packages/dio_studio');
  } catch (e) {
    // ignore: avoid_print
    print('Request failed with error: $e');
  }

  // ignore: avoid_print
  print('\n=== Example completed successfully ===');
}
