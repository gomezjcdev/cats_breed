import 'package:flutter/material.dart';

import '../../models/cat_image.dart';

class BreedImage extends StatelessWidget {
  final CatImage? catImage;
  final double maxHeight;

  const BreedImage({Key? key, this.catImage, this.maxHeight = 300}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: maxHeight
      ),
      child: catImage != null
          ? FadeInImage.assetNetwork(
              placeholder: 'assets/images/cat_no_image.png',
              image: catImage!.url,
            )
          : Image.asset('assets/images/cat_no_image.png'),
    );
  }
}
