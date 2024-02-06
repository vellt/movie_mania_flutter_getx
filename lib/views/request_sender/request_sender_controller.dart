import 'dart:convert';
import 'package:get/get.dart';
import 'package:movie_mania/models/method.dart';
import 'package:http/http.dart' as http;

class RequestSenderController extends GetxController {
  bool loading = true; // váltó

  @override
  void onReady() {
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
          Get.back(result: {
            'json': json.decode(response.body),
            'statusCode': response.statusCode
          });
          break;
        case Method.POST:
          Map body = Get.arguments['body'] as Map;
          var response = await http.post(Uri.parse(route), body: body);
          Get.back(result: {
            'json': json.decode(response.body),
            'statusCode': response.statusCode
          });
          break;
        case Method.PUT:
          Map body = Get.arguments['body'] as Map;
          var response = await http.put(Uri.parse(route), body: body);
          Get.back(result: {
            'json': json.decode(response.body),
            'statusCode': response.statusCode
          });
          break;
        case Method.FILE:
          List<int> body = (Get.arguments['body'] as Map)["path"] as List<int>;
          var request = await http.MultipartRequest('PUT', Uri.parse(route))
            ..files.add(await http.MultipartFile.fromBytes('image', body,
                filename: 'image.jpg'));
          var response = await request.send();
          String json = await response.stream.bytesToString();
          print(json);
          Get.back(result: {
            'json': json.replaceAll("\"", ""),
            'statusCode': response.statusCode
          });

          break;
        default:
          break;
      }
    } catch (e) {
      loading = false;
      print(e);
      update();
    }
  }
}
