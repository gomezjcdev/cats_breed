import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragma_test/src/bloc/cat_breed_bloc.dart';

import 'src/services/cat_api_repository.dart';
import 'src/ui/screens/cat_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (
      BlocProvider(
          create: (_) => CatBreedBloc(repository: CatBreedApiRepository()),
          child: const MaterialApp(
            title: 'Cat Breeds',
            debugShowCheckedModeBanner: false,
            home: CatList(),
          ),
      )
    );
  }
}

