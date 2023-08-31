// ignore_for_file: avoid_unnecessary_containers

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardGrid extends StatelessWidget {
  final String name;
  final String estado;
  final String? urlImage;
  const CardGrid(
      {super.key, required this.name, required this.estado, this.urlImage});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: GestureDetector(
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                alignment: Alignment.center,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: CachedNetworkImage(
                        imageUrl: urlImage.toString(),
                        height: Get.height * 0.14,
                        placeholder: (context, url) =>
                            Image.asset('assets/gifs/gif_loading.gif'),
                        errorWidget: (context, url, error) => Image.asset(
                              'assets/images/image_not_found.jpg',
                              width: Get.width * 0.35,
                            ))),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 8),
                child: Text(name,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis)),
              )),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(estado,
                    style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis)),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
