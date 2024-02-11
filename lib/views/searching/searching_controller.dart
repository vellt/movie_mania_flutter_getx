import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_mania/backend/backend.dart';
import 'package:movie_mania/models/series.dart';
import 'package:movie_mania/views/series/series_view.dart';

class SearchingController extends GetxController {
  TextEditingController searchController = TextEditingController();
  List<Series> seriesList = [];
  bool loading = true;

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  Future<void> loadData() async {
    loading = true;
    update();
    List<dynamic> response = await Backend.POST(
      route: "/searching",
      body: {"searching": searchController.text},
    );
    loading = false;
    seriesList = response.map((e) => Series.fromJson(e)).toList();
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
