// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SuitableFlowerModel {
  String? flowerName;
  String? classification;
  String? water;
  String? soil;
  String? sunlight;
  String? growMethod;
  String? addCare;
  String? plantDepth;
  String? spacing;
  SuitableFlowerModel({
    this.flowerName,
    this.classification,
    this.water,
    this.soil,
    this.sunlight,
    this.growMethod,
    this.addCare,
    this.plantDepth,
    this.spacing,
  });

  SuitableFlowerModel copyWith({
    String? flowerName,
    String? classification,
    String? water,
    String? soil,
    String? sunlight,
    String? growMethod,
    String? addCare,
    String? plantDepth,
    String? spacing,
  }) {
    return SuitableFlowerModel(
      flowerName: flowerName ?? this.flowerName,
      classification: classification ?? this.classification,
      water: water ?? this.water,
      soil: soil ?? this.soil,
      sunlight: sunlight ?? this.sunlight,
      growMethod: growMethod ?? this.growMethod,
      addCare: addCare ?? this.addCare,
      plantDepth: plantDepth ?? this.plantDepth,
      spacing: spacing ?? this.spacing,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'flowerName': flowerName,
      'classification': classification,
      'water': water,
      'soil': soil,
      'sunlight': sunlight,
      'growMethod': growMethod,
      'addCare': addCare,
      'plantDepth': plantDepth,
      'spacing': spacing,
    };
  }

  factory SuitableFlowerModel.fromMap(Map<String, dynamic> map) {
    return SuitableFlowerModel(
      flowerName: map['flowerName'] != null ? map['flowerName'] as String : null,
      classification: map['classification'] != null ? map['classification'] as String : null,
      water: map['water'] != null ? map['water'] as String : null,
      soil: map['soil'] != null ? map['soil'] as String : null,
      sunlight: map['sunlight'] != null ? map['sunlight'] as String : null,
      growMethod: map['growMethod'] != null ? map['growMethod'] as String : null,
      addCare: map['addCare'] != null ? map['addCare'] as String : null,
      plantDepth: map['plantDepth'] != null ? map['plantDepth'] as String : null,
      spacing: map['spacing'] != null ? map['spacing'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SuitableFlowerModel.fromJson(String source) =>
      SuitableFlowerModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SuitableFlowerModel(flowerName: $flowerName, classification: $classification, water: $water, soil: $soil, sunlight: $sunlight, growMethod: $growMethod, addCare: $addCare, plantDepth: $plantDepth, spacing: $spacing)';
  }

  @override
  bool operator ==(covariant SuitableFlowerModel other) {
    if (identical(this, other)) return true;

    return other.flowerName == flowerName &&
        other.classification == classification &&
        other.water == water &&
        other.soil == soil &&
        other.sunlight == sunlight &&
        other.growMethod == growMethod &&
        other.addCare == addCare &&
        other.plantDepth == plantDepth &&
        other.spacing == spacing;
  }

  @override
  int get hashCode {
    return flowerName.hashCode ^
        classification.hashCode ^
        water.hashCode ^
        soil.hashCode ^
        sunlight.hashCode ^
        growMethod.hashCode ^
        addCare.hashCode ^
        plantDepth.hashCode ^
        spacing.hashCode;
  }
}
