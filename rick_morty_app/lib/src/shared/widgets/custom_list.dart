import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomList extends StatelessWidget {
  final List listData;
  final String type;
  const CustomList({super.key, required this.listData, required this.type});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: listData.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              onTap: () => Get.toNamed("/detailEpisodeLocation",
                  arguments: [listData[index], type]),
              title: Text(listData[index].name),
              subtitle: Text(type == 'episode'
                  ? listData[index].episode
                  : listData[index].type),
            ),
            const Divider()
          ],
        );
      },
    );
  }
}
