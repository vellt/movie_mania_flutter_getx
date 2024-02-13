import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_mania/backend/backend.dart';
import 'package:movie_mania/models/series.dart';
import 'package:movie_mania/models/user.dart';
import 'package:movie_mania/views/series_details/series_details_view.dart';

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
    User user = Get.arguments as User;
    Get.to(
      () => SeriesDetailsView(),
      arguments: {"series": series, "user": user},
      transition: Transition.cupertino,
    );
  }
}
