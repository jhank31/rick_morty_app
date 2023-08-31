import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailEpisodeLocation extends StatelessWidget {
  const DetailEpisodeLocation({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var modelo = Get.arguments[0];
    String type = Get.arguments[1];
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
                    child: const Image(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/background.jpg'))),
                Positioned(
                    top: 40,
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                        size: 35,
                      ),
                      onPressed: () => Get.back(),
                    )),
                Positioned(
                    bottom: 10,
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 10,
                      ),
                      child: type == 'episode'
                          ? Text(
                              'Episodios',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.green,
                                  fontFamily: GoogleFonts.phudu().fontFamily),
                            )
                          : Text('Ubicaciones',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.green,
                                  fontFamily: GoogleFonts.phudu().fontFamily)),
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
                    "Nombre: ${modelo.name}",
                    style: textStyle(),
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  type == 'episode'
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Fecha de lanzamiento: ${modelo.airDate}",
                              style: textStyle(),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Episodio: ${modelo.episode}",
                              style: textStyle(),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tipo: ${modelo.type}",
                              style: textStyle(),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Dimension: ${modelo.dimension}",
                              style: textStyle(),
                              textAlign: TextAlign.left,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                          ],
                        )
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
