import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_mania/controllers/request_view_controller.dart';
import 'package:movie_mania/models/method.dart';
import 'package:movie_mania/models/series.dart';
import 'package:movie_mania/views/series_details/series_details_view.dart';
import 'package:movie_mania/views/request_sender_view.dart';

class SearchingController extends GetxController {
  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  TextEditingController searchController = TextEditingController();

  List<Series> seriesList = [];

  Future<void> loadData() async {
    var response = await Get.to(() => RequestSenderView(), transition: Transition.noTransition, arguments: {
      'method': Method.POST,
      'route': "http://localhost:3000/searching",
      'body': {"searching": searchController.text}
    });
    Get.delete<RequestViewController>();
    if (response != null) {
      int statusCode = response['statusCode'] as int;
      if (statusCode == 200) {
        var jsonData = response['json'] as List<dynamic>;
        seriesList = jsonData.map((e) => Series.fromJson(e)).toList();
      } else {
        print("error: Stats code $statusCode");
      }
    } else {
      print("error no response");
    }
    update();
  }

  void showDetailsView(Series series) {
    Get.to(
      () => SeriesDetailsView(),
      arguments: series,
      transition: Transition.cupertino,
    );
  }
}
