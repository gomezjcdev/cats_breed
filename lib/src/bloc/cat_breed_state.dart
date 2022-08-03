part of 'cat_breed_bloc.dart';

@immutable
class CatBreedState {
  final CatBreed? selectedBreed;
  final List<CatBreed> catBreeds;
  final bool listLoading;
  final String? errorMessage;

  const CatBreedState(
      {this.catBreeds = const [],
      this.listLoading = false,
      this.selectedBreed,
      this.errorMessage});

  CatBreedState copyWith(
      {CatBreed? selectedBreed,
      List<CatBreed>? catBreeds,
      bool? listLoading,
      String? errorMessage}) {
    return CatBreedState(
      selectedBreed: selectedBreed ?? this.selectedBreed,
      catBreeds: catBreeds ?? this.catBreeds,
      listLoading: listLoading ?? this.listLoading,
      errorMessage: errorMessage,
    );
  }
}
