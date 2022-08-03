class Image {

  final String id;
  final int width;
  final int height;
  final String url;

  Image({
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

  factory Image.fromJson(Map<String, dynamic> map) {
    return Image(
      id: map['id'] as String,
      width: map['width'] as int,
      height: map['height'] as int,
      url: map['url'] as String,
    );
  }
}
