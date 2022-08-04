import 'package:mocktail/mocktail.dart';
import 'package:pragma_test/src/bloc/cat_breed_bloc.dart';
import 'package:pragma_test/src/repositories/cat_breed_repository.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

import '../../mocks/cat_breeds.dart';

class MockCatBreedRepository extends Mock implements CatBreedRepository {}

void main() {
  group('Cat Breed Bloc', () {
    late CatBreedBloc catBreedBloc;
    late MockCatBreedRepository mockCatBreedRepository;

    setUp(() {
      mockCatBreedRepository = MockCatBreedRepository();
      catBreedBloc = CatBreedBloc(repository: mockCatBreedRepository);
    });

    void _arrangeAllBreeds() {
      when(() => mockCatBreedRepository.allBreeds()).thenAnswer((_) async => catBreedsMock);
    }

    test('check initial state', () {
      expect(catBreedBloc.state.selectedBreed, null);
      expect(catBreedBloc.state.catBreeds, []);
      expect(catBreedBloc.state.errorMessage, null);
      expect(catBreedBloc.state.listLoading, false);
    });

    blocTest<CatBreedBloc, CatBreedState>(
      'should get all breeds',
      build: () {
        _arrangeAllBreeds();
        return catBreedBloc;
      },
      act: (bloc) => bloc.add(AllBreedsEvent()),
      expect: () => [
        const CatBreedState(listLoading: true),
        CatBreedState(listLoading: false, catBreeds: catBreedsMock),
      ],
    );

    blocTest<CatBreedBloc, CatBreedState>(
      'should get a breed by id',
      build: () {
        catBreedBloc.emit(catBreedBloc.state.copyWith(catBreeds: catBreedsMock));
        return catBreedBloc;
      },
      act: (bloc) => bloc.add(BreedById("cat1")),
      expect: () => [
        CatBreedState(selectedBreed: catBreedsMock[0], catBreeds: catBreedsMock),
      ],
    );

    blocTest<CatBreedBloc, CatBreedState>(
      'should find a breed by name',
      build: () {
        catBreedBloc.emit(catBreedBloc.state.copyWith(catBreeds: catBreedsMock));
        return catBreedBloc;
      },
      act: (bloc) => bloc.add(SearchByName("cat1")),
      expect: () => [
        CatBreedState(catBreeds: [catBreedsMock[0]]),
      ],
    );

  });
}