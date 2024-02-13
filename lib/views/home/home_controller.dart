import 'package:get/get.dart';
import 'package:movie_mania/backend/backend.dart';
import 'package:movie_mania/views/first/first_controller.dart';
import 'package:movie_mania/models/series.dart';
import 'package:movie_mania/models/user.dart';
import 'package:movie_mania/views/series_details/series_details_view.dart';
import 'package:movie_mania/views/profile_details/profile_details_view.dart';
import 'package:movie_mania/views/searching/searching_view.dart';

class HomeController extends GetxController {
  List<Series> seriesList = [];
  User user = Get.arguments["user"] as User;
  bool loading = true;

  @override
  void onReady() {
    super.onReady();
    Get.delete<FirstController>();
    loadData();
  }

  Future<void> loadData() async {
    loading = true;
    update();
    List<dynamic> response = await Backend.GET(route: "/series");
    seriesList = response.map((e) => Series.fromJson(e)).toList();
    loading = false;
    update();
  }

  void showDetailsView(Series series) {
    Get.to(
      () => SeriesDetailsView(),
      arguments: {"series": series, "user": user},
      transition: Transition.cupertino,
    );
  }

  void showSearchingView() {
    Get.to(
      () => SearchingView(),
      arguments: user,
      transition: Transition.cupertino,
    );
  }

  void showProfileView() async {
    await Get.to(
      () => ProfileDetailsView(),
      transition: Transition.cupertino,
      arguments: {"user": user},
    );
    // módosulthattak az adatok mikor visszatért
    print(user.userImage);
    update();
  }
}
