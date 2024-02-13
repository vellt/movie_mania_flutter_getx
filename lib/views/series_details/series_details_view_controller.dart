import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_mania/backend/backend.dart';
import 'package:movie_mania/models/series.dart';
import 'package:movie_mania/models/user.dart';

class SeriesDetailsViewController extends GetxController {
  Series series = Series.empty();
  List<IconData> icons = [];

  bool loading = true;

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  Future<void> loadData() async {
    loading = true;
    update();
    int seriesId = (Get.arguments["series"] as Series).id;
    int userId = (Get.arguments["user"] as User).userid;
    List<dynamic> response = await Backend.GET(route: "/seriesMobil/$seriesId/$userId");
    series = response.map((e) => Series.fromJson(e)).toList()[0];
    loading = false;
    makeStarList();
    update();
  }

  void makeStarList() {
    icons = [];
    print(series.userRating);
    for (int i = 1; i <= 5; i++) {
      if (i <= series.userRating) {
        icons.add(Icons.star);
      } else {
        icons.add(Icons.star_border);
      }
    }
  }

/*
  void sendRatingRequest(int index) async {
    int seriesId = (Get.arguments["series"] as Series).id;
    int userId = (Get.arguments["user"] as User).userid;
    await Backend.PUT(route: "/ratingMobil/$seriesId/$userId", body: {"rating": index});
    loadData();
  }*/
}
