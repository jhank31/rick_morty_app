import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_morty_app/src/presentation/character/view/widgets/card_grid.dart';

class CustomGrid extends StatelessWidget {
  final List listToShow;
  const CustomGrid({super.key, required this.listToShow});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
      itemCount: listToShow.length,
      itemBuilder: (BuildContext context, int index) {
        final elementToList = listToShow[index];
        return GestureDetector(
          onTap: () =>
              Get.toNamed("/detailCharacter", arguments: elementToList),
          child: FittedBox(
            fit: BoxFit.fill,
            child: CardGrid(
                name: elementToList.name,
                estado: elementToList.status,
                urlImage: elementToList.image),
          ),
        );
      },
    );
  }
}
