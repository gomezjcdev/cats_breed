import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragma_test/src/bloc/cat_breed_bloc.dart';
import 'package:pragma_test/src/ui/widgets/breed_card.dart';

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
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            TextField(
              onChanged: (value) => BlocProvider.of<CatBreedBloc>(context, listen: false).add(SearchByName(value)),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Buscar por raza',
                suffixIcon: Icon(Icons.search),
              ),
            ),
            const SizedBox(height: 20),
            BlocBuilder<CatBreedBloc, CatBreedState>(builder: (_, state) {
              if (state.listLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.errorMessage != null) {
                return Center(child: Text(state.errorMessage!));
              }

              return Expanded(
                child: ListView.separated(
                  itemBuilder: (context, index) {
                    final breed = state.catBreeds[index];
                    return BreedCard(catBreed: breed);
                  },
                  itemCount: state.catBreeds.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                ),
              );
            })
          ],
        ),
      ),
    );
  }
}
