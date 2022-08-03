import 'package:pragma_test/src/repositories/cat_breed_repository.dart';

import '../models/cat_breed.dart';
import '../utils/request.dart';

class CatBreedApiRepository extends CatBreedRepository {

  @override
  Future<List<CatBreed>> allBreeds() async {
    try {
      final response = await Request().getRequest('breeds');

      return List<CatBreed>.from(response.map((value) => CatBreed.fromJson(value)));
    } catch (err) {
      throw err.toString();
    }
  }

}