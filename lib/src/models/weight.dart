import 'package:equatable/equatable.dart';

class Weight extends Equatable {
  final String imperial;
  final String metric;

  const Weight({
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

  @override
  List<Object?> get props => [imperial, metric];
}