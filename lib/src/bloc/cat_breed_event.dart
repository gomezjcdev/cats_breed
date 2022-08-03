part of 'cat_breed_bloc.dart';

@immutable
abstract class CatBreedEvent {}

class AllBreedsEvent extends CatBreedEvent {}

class BreedById extends CatBreedEvent {
  final String id;

  BreedById(this.id);
}