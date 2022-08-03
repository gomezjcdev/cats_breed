import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragma_test/src/bloc/cat_breed_bloc.dart';

class CatList extends StatefulWidget {
  const CatList({Key? key}) : super(key: key);

  @override
  State<CatList> createState() => _CatListState();
}

class _CatListState extends State<CatList> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CatBreedBloc>(context, listen: false).add(AllBreedsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('CatBreeds')),
      body: BlocBuilder<CatBreedBloc, CatBreedState>(builder: (_, state) {
        if (state.listLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state.errorMessage != null) {
          return Center(child: Text(state.errorMessage!));
        }

        return ListView.builder(
          itemBuilder: (context, index) {
            final breed = state.catBreeds[index];

            return ListTile(
              title: Text(breed.name),
              subtitle: Text(breed.countryCode),
            );
          },
          itemCount: state.catBreeds.length,
        );
      }),
    );
  }
}
