// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flower_prediction/models/treatman_plan_model.dart';

class DiseaseModel {
  String? key;
  String? disease;
  String? description;
  String? description2;
  Map<int, TreatmentPlan>? treatmentPlan;
  DiseaseModel({
    this.key,
    this.disease,
    this.description,
    this.description2,
    this.treatmentPlan,
  });

  DiseaseModel copyWith({
    String? key,
    String? disease,
    String? description,
    String? description2,
    Map<int, TreatmentPlan>? treatmentPlan,
  }) {
    return DiseaseModel(
      key: key ?? this.key,
      disease: disease ?? this.disease,
      description: description ?? this.description,
      description2: description2 ?? this.description2,
      treatmentPlan: treatmentPlan ?? this.treatmentPlan,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'disease': disease,
      'description': description,
      'description2': description2,
      'treatmentPlan': treatmentPlan,
    };
  }

  factory DiseaseModel.fromMap(Map<String, dynamic> map) {
    return DiseaseModel(
      key: map['key'] != null ? map['key'] as String : null,
      disease: map['disease'] != null ? map['disease'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      description2: map['description2'] != null ? map['description2'] as String : null,
      treatmentPlan: map['treatmentPlan'] != null
          ? Map<int, TreatmentPlan>.from(map['treatmentPlan'] as Map<int, TreatmentPlan>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DiseaseModel.fromJson(String source) =>
      DiseaseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'DiseaseModel(key: $key, disease: $disease, description: $description, description2: $description2, treatmentPlan: $treatmentPlan)';
  }

  @override
  bool operator ==(covariant DiseaseModel other) {
    if (identical(this, other)) return true;

    return other.key == key &&
        other.disease == disease &&
        other.description == description &&
        other.description2 == description2 &&
        mapEquals(other.treatmentPlan, treatmentPlan);
  }

  @override
  int get hashCode {
    return key.hashCode ^
        disease.hashCode ^
        description.hashCode ^
        description2.hashCode ^
        treatmentPlan.hashCode;
  }
}
