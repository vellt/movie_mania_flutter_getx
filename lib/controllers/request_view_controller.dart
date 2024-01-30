import 'dart:convert';
import 'package:get/get.dart';
import 'package:movie_mania/models/method.dart';
import 'package:http/http.dart' as http;

class RequestViewController extends GetxController {
  bool loading = true; // váltó

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    sendRequest();
  }

  void sendRequest() async {
    Method method = Get.arguments['method'] as Method;
    String route = Get.arguments['route'] as String;
    loading = true;
    update();
    try {
      switch (method) {
        case Method.GET:
          var response = await http.get(Uri.parse(route));
          List<dynamic> jsonResponse = json.decode(response.body);
          Get.back(result: {
            'json': jsonResponse,
            'statusCode': response.statusCode
          });
          break;
        default:
          break;
      }
    } catch (e) {
      loading = false;
      update();
    }
  }
}
