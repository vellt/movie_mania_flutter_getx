import 'dart:convert';
import 'package:flutter/material.dart';
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
