import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_mania/backend/backend.dart';
import 'package:movie_mania/models/series.dart';
import 'package:movie_mania/models/user.dart';

class SeriesDetailsViewController extends GetxController {
  Series series = (Get.arguments["series"] as Series);
  User user = (Get.arguments["user"] as User);
  List<IconData> icons = [
    Icons.star_border,
    Icons.star_border,
    Icons.star_border,
    Icons.star_border,
    Icons.star_border,
  ];

  bool loading = true;
  bool expanded = false;

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  Future<void> loadData() async {
    loading = true;
    update();
    List<dynamic> response = await Backend.GET(route: "/seriesMobil/${series.id}/${user.userid}");
    series = response.map((e) => Series.fromJson(e)).toList()[0];
    loading = false;
    makeStarList();
    update();
  }

  void makeStarList() {
    for (int i = 0; i < 5; i++) {
      if (i < series.userRating) {
        icons[i] = (Icons.star);
      } else {
        icons[i] = (Icons.star_border);
      }
    }
  }

  void sendRatingRequest(int index) async {
    await Backend.PUT(route: "/ratingMobil/${series.id}/${user.userid}", body: {"rating": (index + 1).toString()});
    expanded = true;
    loadData();
  }
}
