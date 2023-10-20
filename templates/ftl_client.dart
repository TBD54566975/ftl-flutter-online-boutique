import 'package:http/http.dart' as http;

class FTLHttpClient {
  final String baseUrl;
  final http.Client httpClient;

  FTLHttpClient._({required this.baseUrl, required this.httpClient});

  static FTLHttpClient? _instance;

  static void initialize(
      {required String baseUrl, required http.Client httpClient}) {
    _instance = FTLHttpClient._(baseUrl: baseUrl, httpClient: httpClient);
  }

  static FTLHttpClient get instance {
    assert(_instance != null, 'FTLHttpClient must be initialized first');
    return _instance!;
  }

  Future<http.Response> get(String path, {Map<String, String>? headers}) {
    return httpClient.get(Uri.parse('$baseUrl$path'), headers: headers);
  }

  Future<http.Response> post(String path,
      {Object? body, Map<String, String>? headers}) {
    return httpClient.post(
      Uri.parse('$baseUrl$path'),
      body: body,
      headers: headers,
    );
  }
}
