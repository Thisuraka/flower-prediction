class WeatherModel {
  final String date;
  final double rainfall;
  final double temperature;
  final double windspeed;

  WeatherModel({
    required this.rainfall,
    required this.temperature,
    required this.date,
    required this.windspeed,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      date: json['date'] as String,
      rainfall: double.parse(json['rainfall']),
      temperature: double.parse(json['temperature']),
      windspeed: double.parse(json['windspeed']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'date': date,
      'rainfall': rainfall,
      'temperature': temperature,
      'windspeed': windspeed,
    };
  }
}
