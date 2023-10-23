class UrlConstants {
  static const String environment = "development";
  // static const String environment = "production";
  static const String baseUrl = "http://10.0.2.2:5000";

  static String getDiseaseEndpoint() {
    if (environment == "development") {
      return "$baseUrl/disease-identification";
    } else {
      return "https://identifytype-w2qyntknzq-uc.a.run.app/disease-identification";
    }
  }
}
