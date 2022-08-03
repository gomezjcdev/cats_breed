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
  CatBreedBloc({required CatBreedRepository repository})
      : super(const CatBreedState()) {
    on<AllBreedsEvent>(_allBreeds);
    on<BreedById>(_breedById);
  }

  Future<void> _allBreeds(
      AllBreedsEvent event, Emitter<CatBreedState> emit) async {
    try {
      emit(
        state.copyWith(listLoading: true),
      );

      final response = await Request().getRequest('breeds');

      emit(
        state.copyWith(
          catBreeds:
              List.from(response.map((value) => CatBreed.fromJson(value))),
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
}
