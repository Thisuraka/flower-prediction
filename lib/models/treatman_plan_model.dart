// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TreatmentPlan {
  String? plan;
  String? desc;
  
  TreatmentPlan({
    this.plan,
    this.desc,
  });

  TreatmentPlan copyWith({
    String? plan,
    String? desc,
  }) {
    return TreatmentPlan(
      plan: plan ?? this.plan,
      desc: desc ?? this.desc,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'plan': plan,
      'desc': desc,
    };
  }

  factory TreatmentPlan.fromMap(Map<String, dynamic> map) {
    return TreatmentPlan(
      plan: map['plan'] != null ? map['plan'] as String : null,
      desc: map['desc'] != null ? map['desc'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TreatmentPlan.fromJson(String source) => TreatmentPlan.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TreatmentPlan(plan: $plan, desc: $desc)';

  @override
  bool operator ==(covariant TreatmentPlan other) {
    if (identical(this, other)) return true;
  
    return 
      other.plan == plan &&
      other.desc == desc;
  }

  @override
  int get hashCode => plan.hashCode ^ desc.hashCode;
}
