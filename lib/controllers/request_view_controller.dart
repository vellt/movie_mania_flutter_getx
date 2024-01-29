import 'package:get/get.dart';
import 'package:movie_mania/models/method.dart';
import 'package:http/http.dart' as http;

class RequestViewController extends GetxController {
  Method method;
  String route; // url

  bool loading = true; // váltó
  var response;

  RequestViewController({
    required this.method,
    required this.route,
  }) {
    sendRequest();
  }

  void sendRequest() async {
    loading = true;
    update();

    try {
      switch (method) {
        case Method.GET:
          response = await http.get(Uri.parse(route));
          break;
        default:
          break;
      }
      Get.back(result: response);
    } catch (e) {
      loading = false;
      update();
    }
  }
}
