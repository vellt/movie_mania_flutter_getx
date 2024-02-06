import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_mania/views/request_sender/request_sender_controller.dart';
import 'package:movie_mania/models/method.dart';
import 'package:movie_mania/models/series.dart';
import 'package:movie_mania/views/series/series_view.dart';
import 'package:movie_mania/views/request_sender/request_sender_view.dart';

class SearchingController extends GetxController {
  TextEditingController searchController = TextEditingController();
  List<Series> seriesList = [];

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  Future<void> loadData() async {
    var response = await Get.to(() => RequestSenderView(),
        transition: Transition.noTransition,
        arguments: {
          'method': Method.POST,
          'route': "http://localhost:3000/searching",
          'body': {"searching": searchController.text},
        });
    Get.delete<RequestSenderController>();
    print(response);
    if (response != null) {
      int statusCode = response['statusCode'] as int;
      if (statusCode == 200) {
        var jsonData = response['json'] as List<dynamic>;
        seriesList = jsonData.map((e) => Series.fromJson(e)).toList();
        print(seriesList.length);
      } else
        print("error: Stats code $statusCode"); //hibakezelés
    } else
      print("error no response"); // hibakezelés
    update();
  }

  void showDetailsView(Series series) {
    Get.to(
      () => SeriesView(),
      arguments: series,
      transition: Transition.cupertino,
    );
  }
}
