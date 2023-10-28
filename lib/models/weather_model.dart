class WeatherModel {
  final int level0;
  final int index;
  final String month;
  final double predicted;

  WeatherModel({
    required this.level0,
    required this.index,
    required this.month,
    required this.predicted,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      level0: json['level_0'] as int,
      index: json['index'] as int,
      month: json['Month'] as String,
      predicted: json['predicted'] as double,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'level_0': level0,
      'index': index,
      'Month': month,
      'predicted': predicted,
    };
  }
}
