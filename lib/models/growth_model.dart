// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GrowthModel {
  String? key;
  String? status;
  String? desc;
  String? fertilAmount;
  String? fertilTiming;
  String? appFreq;
  String? appMethod;
  String? flushWithWater;
  String? monitorAndAdjust;
  String? soilQuality;
  GrowthModel({
    this.key,
    this.status,
    this.desc,
    this.fertilAmount,
    this.fertilTiming,
    this.appFreq,
    this.appMethod,
    this.flushWithWater,
    this.monitorAndAdjust,
    this.soilQuality,
  });

  GrowthModel copyWith({
    String? key,
    String? status,
    String? desc,
    String? fertilAmount,
    String? fertilTiming,
    String? appFreq,
    String? appMethod,
    String? flushWithWater,
    String? monitorAndAdjust,
    String? soilQuality,
  }) {
    return GrowthModel(
      key: key ?? this.key,
      status: status ?? this.status,
      desc: desc ?? this.desc,
      fertilAmount: fertilAmount ?? this.fertilAmount,
      fertilTiming: fertilTiming ?? this.fertilTiming,
      appFreq: appFreq ?? this.appFreq,
      appMethod: appMethod ?? this.appMethod,
      flushWithWater: flushWithWater ?? this.flushWithWater,
      monitorAndAdjust: monitorAndAdjust ?? this.monitorAndAdjust,
      soilQuality: soilQuality ?? this.soilQuality,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'key': key,
      'status': status,
      'desc': desc,
      'fertilAmount': fertilAmount,
      'fertilTiming': fertilTiming,
      'appFreq': appFreq,
      'appMethod': appMethod,
      'flushWithWater': flushWithWater,
      'monitorAndAdjust': monitorAndAdjust,
      'soilQuality': soilQuality,
    };
  }

  factory GrowthModel.fromMap(Map<String, dynamic> map) {
    return GrowthModel(
      key: map['key'] != null ? map['key'] as String : null,
      status: map['status'] != null ? map['status'] as String : null,
      desc: map['desc'] != null ? map['desc'] as String : null,
      fertilAmount: map['fertilAmount'] != null ? map['fertilAmount'] as String : null,
      fertilTiming: map['fertilTiming'] != null ? map['fertilTiming'] as String : null,
      appFreq: map['appFreq'] != null ? map['appFreq'] as String : null,
      appMethod: map['appMethod'] != null ? map['appMethod'] as String : null,
      flushWithWater: map['flushWithWater'] != null ? map['flushWithWater'] as String : null,
      monitorAndAdjust: map['monitorAndAdjust'] != null ? map['monitorAndAdjust'] as String : null,
      soilQuality: map['soilQuality'] != null ? map['soilQuality'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GrowthModel.fromJson(String source) =>
      GrowthModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'GrowthModel(key: $key, status: $status, desc: $desc, fertilAmount: $fertilAmount, fertilTiming: $fertilTiming, appFreq: $appFreq, appMethod: $appMethod, flushWithWater: $flushWithWater, monitorAndAdjust: $monitorAndAdjust, soilQuality: $soilQuality)';
  }

  @override
  bool operator ==(covariant GrowthModel other) {
    if (identical(this, other)) return true;

    return other.key == key &&
        other.status == status &&
        other.desc == desc &&
        other.fertilAmount == fertilAmount &&
        other.fertilTiming == fertilTiming &&
        other.appFreq == appFreq &&
        other.appMethod == appMethod &&
        other.flushWithWater == flushWithWater &&
        other.monitorAndAdjust == monitorAndAdjust &&
        other.soilQuality == soilQuality;
  }

  @override
  int get hashCode {
    return key.hashCode ^
        status.hashCode ^
        desc.hashCode ^
        fertilAmount.hashCode ^
        fertilTiming.hashCode ^
        appFreq.hashCode ^
        appMethod.hashCode ^
        flushWithWater.hashCode ^
        monitorAndAdjust.hashCode ^
        soilQuality.hashCode;
  }
}
