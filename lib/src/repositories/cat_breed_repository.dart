import '../models/cat_breed.dart';

abstract class CatBreedRepository {
  Future<List<CatBreed>> allBreeds();
}
