import 'package:flutter/material.dart';
import 'package:pragma_test/src/ui/screens/cat_detail.dart';
import 'package:pragma_test/src/ui/widgets/breed_image.dart';

import '../../models/cat_breed.dart';

class BreedCard extends StatelessWidget {

  final CatBreed catBreed;

  const BreedCard({Key? key, required this.catBreed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black26)
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(catBreed.name),
                TextButton(onPressed: () => _navigateToDetail(context), child: const Text('Más...'))
              ],
            ),
            BreedImage(catImage: catBreed.image),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(catBreed.origin),
                Text('Inteligencia: ${catBreed.intelligence}'),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  _navigateToDetail(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CatDetail(id: catBreed.id)),
    );
  }
}
