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
  User user = Get.arguments as User;
  bool loading = true;

  @override
  void onReady() {
    super.onReady();
    Get.delete<FirstController>(); // betölt a home akkor törli a first (login/reg nézetet)
    loadData();
  }

  Future<void> loadData() async {
    loading = true;
    update();
    List<dynamic> response = await Backend.Get(route: "/series");
    seriesList = response.map((e) => Series.fromJson(e)).toList();
    loading = false;
    update();
  }

  void showDetailsView(Series series) {
    Get.to(
      () => SeriesDetailsView(),
      arguments: series,
      transition: Transition.cupertino,
    );
  }

  void showSearchView() {
    Get.to(
      () => SearchingView(),
      transition: Transition.cupertino,
    );
  }

  void showProfileDetailsView() async {
    await Get.to(
      () => ProfileDetailsView(),
      arguments: user,
      transition: Transition.cupertino,
    );
    // módosulthatnak az adatok mikor visszatérünk
    update();
  }
}
