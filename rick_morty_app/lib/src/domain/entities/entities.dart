 import 'package:dio/dio.dart';
import 'package:rick_morty_app/src/domain/info/model/info_model.dart';

Future<List<Map<String, dynamic>>> getAllEntities(String url) async {
    final Dio dio = Dio();
    try {
      List<Map<String, dynamic>> allEntities = [];
      String? nextUrl = url;
      while (nextUrl != null) {
        var response = await dio.get(nextUrl);
        try {
          Info info = Info.fromJson(response.data["info"]);
          nextUrl = info.next;
          allEntities.addAll(
              List<Map<String, dynamic>>.from(response.data["results"]));
        } catch (e) {
          allEntities.addAll(List<Map<String, dynamic>>.from(response.data));
          nextUrl = null;
        }
      }

      return allEntities;
    } catch (e) {
      rethrow;
    }
  }