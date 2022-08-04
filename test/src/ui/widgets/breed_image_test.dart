import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:network_image_mock/network_image_mock.dart';
import 'package:pragma_test/src/bloc/cat_breed_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pragma_test/src/models/cat_image.dart';
import 'package:pragma_test/src/repositories/cat_breed_repository.dart';
import 'package:pragma_test/src/ui/widgets/breed_image.dart';

class MockCatBreedRepository extends Mock implements CatBreedRepository {}

void main() {
  late MockCatBreedRepository mockCatBreedRepository;

  setUp(() {
    mockCatBreedRepository = MockCatBreedRepository();
  });

  Widget createWidgetUnderTest({CatImage? catImage, double? maxHeight}) {
    return BlocProvider(
      create: (_) => CatBreedBloc(repository: mockCatBreedRepository),
      child: MaterialApp(
        title: 'Cat Breeds',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: BreedImage(catImage: catImage, maxHeight: maxHeight ?? 300),
        ),
      ),
    );
  }

  testWidgets(
    "should render image asset when catImage param is null",
    (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      expect(find.byType(Image), findsOneWidget);
    },
  );

  testWidgets(
    "should render FadeInImage asset when catImage param is not null",
    (WidgetTester tester) async {
      await mockNetworkImagesFor(
        () => tester.pumpWidget(
          createWidgetUnderTest(
            catImage: const CatImage(
                id: "1",
                width: 1,
                height: 1,
                url: "https://via.placeholder.com/150"),
          ),
        ),
      );

      expect(find.byType(FadeInImage), findsOneWidget);
    },
  );

  testWidgets(
    "should have a maxHeight of 300 if the param is not send",
    (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest());
      final toTest = tester.widget<ConstrainedBox>(find.byKey(const Key('breed_image_constrained_box')));
      expect(toTest.constraints.maxHeight, 300);
    },
  );

  testWidgets(
    "should have a maxHeight of n if the param is send",
        (WidgetTester tester) async {
      await tester.pumpWidget(createWidgetUnderTest(maxHeight: 500));
      final toTest = tester.widget<ConstrainedBox>(find.byKey(const Key('breed_image_constrained_box')));
      expect(toTest.constraints.maxHeight, 500);
    },
  );
}
