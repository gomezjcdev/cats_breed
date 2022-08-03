import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragma_test/src/bloc/cat_breed_bloc.dart';

class CatDetail extends StatefulWidget {
  final String id;

  const CatDetail({Key? key, required this.id}) : super(key: key);

  @override
  State<CatDetail> createState() => _CatDetailState();
}

class _CatDetailState extends State<CatDetail> {
  @override
  void initState() {
    super.initState();
    final breedBloc = BlocProvider.of<CatBreedBloc>(context, listen: false);
    breedBloc.add(BreedById(widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CatBreedBloc, CatBreedState>(
      builder: (context, state) {

        if (state.selectedBreed != null) {
          return Scaffold(
            appBar: AppBar(title: Text(state.selectedBreed!.name)),
            body: Container(),
          );
        }

        return Scaffold(
          appBar: AppBar(title: const Text('CatBreeds')),
          body: const Center(child: Text('Ocurrio un error al buscar la raza.')),
        );
      },
    );
  }
}
