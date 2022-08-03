import 'package:flutter/material.dart';

import '../../models/cat_image.dart';

class BreedImage extends StatelessWidget {
  final CatImage? catImage;

  const BreedImage({Key? key, this.catImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: 300
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
