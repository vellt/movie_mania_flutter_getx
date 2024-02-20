import 'dart:math';

import 'package:get/get.dart';
import 'package:movie_mania/backend/backend.dart';
import 'package:movie_mania/models/series.dart';
import 'package:movie_mania/models/user.dart';
import 'package:movie_mania/views/first/first_controller.dart';
import 'package:movie_mania/views/profile_details/profile_details_view.dart';
import 'package:movie_mania/views/series_details/series_details_view.dart';
import 'package:movie_mania/views/searching/searching_view.dart';

class HomeController extends GetxController {
  List<Series> seriesList = [];
  User user = Get.arguments["user"] as User;
  bool loading = true;

  @override
  void onReady() {
    super.onReady();
    Get.delete<FirstController>(); // betölt a home akkor törli a first (login/reg nézetet)
    loadData();
  }

  // kezdeti sorozat adatokat betölti
  Future<void> loadData() async {
    loading = true;
    update();
    List<dynamic> response = await Backend.Get(route: "/series");
    seriesList = response.map((e) => Series.fromJson(e)).toList();
    loading = false;
    update();
  }

  // amikor egy sorozatra rákattintok
  // betöltődnek az adatai + hogy arra a sorozatra mennyi csillagot adtam
  void showDetailsView(Series series) {
    Get.to(
      () => SeriesDetailsView(),
      arguments: {"series": series, "user": user},
      transition: Transition.cupertino,
    );
  }

  // kereső, ennek is át kell adnom a user adatait
  void showSearchView() {
    Get.to(
      () => SearchingView(),
      arguments: {"user": user},
      transition: Transition.cupertino,
    );
  }

  void showProfileDetailsView() async {
    await Get.to(
      () => ProfileDetailsView(),
      arguments: {"user": user},
      transition: Transition.cupertino,
    );
    // módosulthatnak az adatok mikor visszatérünk
    update();
  }

  String getProfilePictureUrl() {
    return "${Backend.imageBaseUrl}${user.userImage}?v=${Random().nextInt(1000)}";
  }
}
