import 'package:dio/dio.dart';

class MobilSettingsApiTwo {
  static Future getMobilSettingsApiTwo() async {
    var dio = Dio();
    try {
      final response =
          await dio.get("https://jsonplaceholder.typicode.com/posts");
      if (response.statusCode == 200) {
        if (response.data != "[]") {
          dio.close();
        }

        return response;
      }
    } catch (e) {
      return null;
    }
  }
}
