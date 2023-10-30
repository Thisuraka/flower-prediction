// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PlantCostModel {
  final double? costPerPlant;
  final double? fertilizerPerUnit;
  final int? flowersPerPlant;
  final double? singlePlantCost;
  final double? totalCost;
  final int? totalNoOfFlowers;
  final double? travelCost;

  PlantCostModel({
    this.costPerPlant,
    this.fertilizerPerUnit,
    this.flowersPerPlant,
    this.singlePlantCost,
    this.totalCost,
    this.totalNoOfFlowers,
    this.travelCost,
  });

  PlantCostModel copyWith({
    double? costPerPlant,
    double? fertilizerPerUnit,
    int? flowersPerPlant,
    double? singlePlantCost,
    double? totalCost,
    int? totalNoOfFlowers,
    double? travelCost,
  }) {
    return PlantCostModel(
      costPerPlant: costPerPlant ?? this.costPerPlant,
      fertilizerPerUnit: fertilizerPerUnit ?? this.fertilizerPerUnit,
      flowersPerPlant: flowersPerPlant ?? this.flowersPerPlant,
      singlePlantCost: singlePlantCost ?? this.singlePlantCost,
      totalCost: totalCost ?? this.totalCost,
      totalNoOfFlowers: totalNoOfFlowers ?? this.totalNoOfFlowers,
      travelCost: travelCost ?? this.travelCost,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cost_per_plant': costPerPlant,
      'fertilizer_per_unit': fertilizerPerUnit,
      'flowers_per_plant': flowersPerPlant,
      'single_plant_cost': singlePlantCost,
      'total_cost': totalCost,
      'total_no_of_flowers': totalNoOfFlowers,
      'travel_cost': travelCost,
    };
  }

  factory PlantCostModel.fromMap(Map<String, dynamic> map) {
    return PlantCostModel(
      costPerPlant: map['cost_per_plant'] != null ? map['cost_per_plant'] as double : null,
      fertilizerPerUnit: map['fertilizer_per_unit'] != null ? map['fertilizer_per_unit'] as double : null,
      flowersPerPlant: map['flowers_per_plant'] != null ? map['flowers_per_plant'] as int : null,
      singlePlantCost: map['single_plant_cost'] != null ? map['single_plant_cost'] as double : null,
      totalCost: map['total_cost'] != null ? map['total_cost'] as double : null,
      totalNoOfFlowers: map['total_no_of_flowers'] != null ? map['total_no_of_flowers'] as int : null,
      travelCost: map['travel_cost'] != null ? map['travel_cost'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlantCostModel.fromJson(String source) =>
      PlantCostModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PlantCostModel(costPerPlant: $costPerPlant, fertilizerPerUnit: $fertilizerPerUnit, flowersPerPlant: $flowersPerPlant, singlePlantCost: $singlePlantCost, totalCost: $totalCost, totalNoOfFlowers: $totalNoOfFlowers, travelCost: $travelCost)';
  }

  @override
  bool operator ==(covariant PlantCostModel other) {
    if (identical(this, other)) return true;

    return other.costPerPlant == costPerPlant &&
        other.fertilizerPerUnit == fertilizerPerUnit &&
        other.flowersPerPlant == flowersPerPlant &&
        other.singlePlantCost == singlePlantCost &&
        other.totalCost == totalCost &&
        other.totalNoOfFlowers == totalNoOfFlowers &&
        other.travelCost == travelCost;
  }

  @override
  int get hashCode {
    return costPerPlant.hashCode ^
        fertilizerPerUnit.hashCode ^
        flowersPerPlant.hashCode ^
        singlePlantCost.hashCode ^
        totalCost.hashCode ^
        totalNoOfFlowers.hashCode ^
        travelCost.hashCode;
  }
}
