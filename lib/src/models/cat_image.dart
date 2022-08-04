import 'package:equatable/equatable.dart';

class CatImage extends Equatable {
  final String id;
  final int width;
  final int height;
  final String url;

  const CatImage({
    required this.id,
    required this.width,
    required this.height,
    required this.url,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'width': width,
      'height': height,
      'url': url,
    };
  }

  factory CatImage.fromJson(Map<String, dynamic> map) {
    return CatImage(
      id: map['id'] as String,
      width: map['width'] as int,
      height: map['height'] as int,
      url: map['url'] as String,
    );
  }

  @override
  List<Object> get props => [id, width, height, url];
}
