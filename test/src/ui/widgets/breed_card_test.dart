import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:pragma_test/src/bloc/cat_breed_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pragma_test/src/models/cat_breed.dart';
import 'package:pragma_test/src/repositories/cat_breed_repository.dart';
import 'package:pragma_test/src/ui/widgets/breed_card.dart';

import '../../../mocks/cat_breeds.dart';

class MockCatBreedRepository extends Mock implements CatBreedRepository {}

void main() {
  late MockCatBreedRepository mockCatBreedRepository;

  setUp(() {
    mockCatBreedRepository = MockCatBreedRepository();
  });

  Widget createWidgetUnderTest({required CatBreed catBreed}) {
    return BlocProvider(
      create: (_) => CatBreedBloc(repository: mockCatBreedRepository),
      child: MaterialApp(
        title: 'Cat Breeds',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: BreedCard(catBreed: catBreed),
        ),
      ),
    );
  }

  testWidgets(
    "should render the text with the name, intelligence and origin",
    (WidgetTester tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(createWidgetUnderTest(catBreed: catBreedsMock[0])));
      expect(find.text(catBreedsMock[0].name), findsOneWidget);
      expect(find.text(catBreedsMock[0].origin), findsOneWidget);
      expect(find.text('Inteligencia: ${catBreedsMock[0].intelligence}'),
          findsOneWidget);
    },
  );

  testWidgets(
    "should render the image if Image is not null",
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(createWidgetUnderTest(catBreed: catBreedsMock[0])));
      expect(find.byType(FadeInImage), findsOneWidget);
    },
  );

  testWidgets(
    "should render the asset image if Image is null",
        (WidgetTester tester) async {
      await mockNetworkImagesFor(() => tester.pumpWidget(createWidgetUnderTest(catBreed: catBreedMockWithoutImage)));
      expect(find.byType(Image), findsOneWidget);
    },
  );
}
