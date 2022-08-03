import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pragma_test/src/bloc/cat_breed_bloc.dart';
import 'package:pragma_test/src/ui/widgets/breed_image.dart';

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
          final breed = state.selectedBreed!;
          return Scaffold(
            appBar: AppBar(title: Text(breed.name)),
            body: Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Center(
                      child: BreedImage(catImage: breed.image, maxHeight: 500)),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(breed.description),
                          const SizedBox(height: 20),
                          _additionalInfo('País de origen', breed.origin),
                          _additionalInfo('Temperamento', breed.temperament),
                          _additionalInfo('Esperanza de vida', breed.lifeSpan),
                          _additionalInfo('Inteligencia', breed.intelligence.toString()),
                          _additionalInfo('Adaptabilidad', breed.adaptability.toString()),
                          _additionalInfo('Amistad con perros', breed.dogFriendly.toString()),
                          _additionalInfo('Nivel de energia', breed.energyLevel.toString()),
                          _additionalInfo('Problemas de salud', breed.healthIssues.toString()),
                          _additionalInfo('Otros nombres', breed.altNames.toString()),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(title: const Text('CatBreeds')),
          body:
              const Center(child: Text('Ocurrio un error al buscar la raza.')),
        );
      },
    );
  }

  Widget _additionalInfo(String title, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        const SizedBox(height: 5),
        Padding(padding: const EdgeInsets.only(left: 5), child: Text(text)),
        const SizedBox(height: 20),
      ],
    );
  }
}
