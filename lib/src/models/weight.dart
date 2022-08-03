class Weight {
  final String imperial;
  final String metric;

  Weight({
    required this.imperial,
    required this.metric,
  });

  Map<String, dynamic> toJson() {
    return {
      'imperial': imperial,
      'metric': metric,
    };
  }

  factory Weight.fromJson(Map<String, dynamic> map) {
    return Weight(
      imperial: map['imperial'] as String,
      metric: map['metric'] as String,
    );
  }
}