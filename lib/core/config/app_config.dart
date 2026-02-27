class AppConfig {
  final String baseUrl;
  final String apiKey;
  final int connectionTimeout;
  final int receiveTimeout;
  final bool isDevEnvironment;

  const AppConfig({
    required this.baseUrl,
    required this.apiKey,
    this.connectionTimeout = 30000,
    this.receiveTimeout = 30000,
    this.isDevEnvironment = false,
  });

  static AppConfig get instance => AppConfig(
    baseUrl: "https://api.restful-api.dev/",
    apiKey: "dfa4f3b5-d2af-4b33-8561-9cde85f7dbc9",
  );
}
