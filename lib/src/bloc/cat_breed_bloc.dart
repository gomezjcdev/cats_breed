import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pragma_test/src/utils/extensions.dart';

import '../models/cat_breed.dart';
import '../repositories/cat_breed_repository.dart';
import '../utils/request.dart';

part 'cat_breed_event.dart';

part 'cat_breed_state.dart';

class CatBreedBloc extends Bloc<CatBreedEvent, CatBreedState> {

  List<CatBreed> _catBreedsCache = [];

  CatBreedBloc({required CatBreedRepository repository})
      : super(const CatBreedState()) {
    on<AllBreedsEvent>(_allBreeds);
    on<BreedById>(_breedById);
    on<SearchByName>(_breedName);
  }

  Future<void> _allBreeds(
      AllBreedsEvent event, Emitter<CatBreedState> emit) async {
    try {
      emit(
        state.copyWith(listLoading: true),
      );

      final response = await Request().getRequest('breeds');

      // creates a cache of the original list
      _catBreedsCache = List.from(response.map((value) => CatBreed.fromJson(value)));
      emit(
        state.copyWith(
          catBreeds: _catBreedsCache,
          listLoading: false,
        ),
      );
    } catch (err, trace) {
      print(trace);
      print(err);
      emit(state.copyWith(errorMessage: err.toString()));
    }
  }

  Future<void> _breedById(BreedById event, Emitter<CatBreedState> emit) async {
    emit(
      state.copyWith(
        selectedBreed:
            state.catBreeds.firstWhereOrNull((breed) => breed.id == event.id),
      ),
    );
  }

  Future<void> _breedName(SearchByName event, Emitter<CatBreedState> emit) async {
    // if the field it's empty apply the cache list
    if (event.name == '') {
      emit(state.copyWith(catBreeds: _catBreedsCache));
    } else {
      emit(
        state.copyWith(
            catBreeds: _catBreedsCache.where((breed) => breed.name.toLowerCase().contains(event.name.toLowerCase())).toList()
        ),
      );
    }
  }
}
