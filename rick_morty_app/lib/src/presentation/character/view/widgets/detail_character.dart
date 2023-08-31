import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rick_morty_app/src/domain/character/model/character_model.dart';

class DetailCharacter extends StatelessWidget {
  const DetailCharacter({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CharacterModel character = Get.arguments;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: Get.width,
                  height: Get.height * 0.5,
                  color: Colors.black,
                  child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: character.image.toString(),
                      placeholder: (context, url) =>
                          Image.asset('assets/gifs/gif_loading.gif'),
                      errorWidget: (context, url, error) => Image.asset(
                            'assets/images/image_not_found.jpg',
                            width: Get.width * 0.35,
                          )),
                ),
                Positioned(
                    top: 40,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.black,
                        size: 35,
                      ),
                      onPressed: () => Get.back(),
                    ))
              ],
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: Get.height * .5,
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Nombre: ${character.name}",
                    style: textStyle(),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Estado: ${character.status}",
                    style: textStyle(),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Genero: ${character.gender}",
                    style: textStyle(),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Especie: ${character.species}",
                    style: textStyle(),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Origen: ${character.origin.name}",
                    style: textStyle(),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Vive en: ${character.location.name}",
                    style: textStyle(),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  textStyle() {
    return const TextStyle(
        fontSize: 20, fontWeight: FontWeight.normal, color: Colors.white70);
  }
}
