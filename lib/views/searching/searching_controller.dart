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

  // kezdeti adatokat tölti be
  Future<void> loadData() async {
    loading = true;
    update();
    List<dynamic> response = await Backend.POST(
      route: "/searching",
      body: {"searching": searchController.text},
    );
    seriesList = response.map((e) => Series.fromJson(e)).toList();
    loading = false;
    update();
  }

  // egy sorozat adatait tölti be, kell hozzá a sorozat azonosítója, és a user azonosítója
  void showDetailsView(Series series) {
    User user = Get.arguments["user"] as User;
    Get.to(
      () => SeriesDetailsView(),
      arguments: {"series": series, "user": user},
      transition: Transition.cupertino,
    );
  }
}
