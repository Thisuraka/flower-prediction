// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ClosestVendorsModel {
  final double avgPrice;
  final double avgRating;
  final double distance;
  final double lat;
  final double lon;
  final int vendorId;

  ClosestVendorsModel({
    required this.avgPrice,
    required this.avgRating,
    required this.distance,
    required this.lat,
    required this.lon,
    required this.vendorId,
  });

  ClosestVendorsModel copyWith({
    double? avgPrice,
    double? avgRating,
    double? distance,
    double? lat,
    double? lon,
    int? vendorId,
  }) {
    return ClosestVendorsModel(
      avgPrice: avgPrice ?? this.avgPrice,
      avgRating: avgRating ?? this.avgRating,
      distance: distance ?? this.distance,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      vendorId: vendorId ?? this.vendorId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'avgPrice': avgPrice,
      'avgRating': avgRating,
      'distance': distance,
      'lat': lat,
      'lon': lon,
      'vendorId': vendorId,
    };
  }

  factory ClosestVendorsModel.fromMap(Map<String, dynamic> map) {
    return ClosestVendorsModel(
      avgPrice: map['avgPrice'] as double,
      avgRating: map['avgRating'] as double,
      distance: map['distance'] as double,
      lat: map['lat'] as double,
      lon: map['lon'] as double,
      vendorId: map['vendorId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory ClosestVendorsModel.fromJson(Map<String, dynamic> json) {
    return ClosestVendorsModel(
      avgPrice: json['avg_price']?.toDouble() ?? 0.0,
      avgRating: json['avg_rating']?.toDouble() ?? 0.0,
      distance: json['distance']?.toDouble() ?? 0.0,
      lat: json['lat']?.toDouble() ?? 0.0,
      lon: json['lon']?.toDouble() ?? 0.0,
      vendorId: json['vendor_id'] ?? 0,
    );
  }

  @override
  String toString() {
    return 'ClosestVendorsModel(avgPrice: $avgPrice, avgRating: $avgRating, distance: $distance, lat: $lat, lon: $lon, vendorId: $vendorId)';
  }

  @override
  bool operator ==(covariant ClosestVendorsModel other) {
    if (identical(this, other)) return true;

    return other.avgPrice == avgPrice &&
        other.avgRating == avgRating &&
        other.distance == distance &&
        other.lat == lat &&
        other.lon == lon &&
        other.vendorId == vendorId;
  }

  @override
  int get hashCode {
    return avgPrice.hashCode ^
        avgRating.hashCode ^
        distance.hashCode ^
        lat.hashCode ^
        lon.hashCode ^
        vendorId.hashCode;
  }
}
