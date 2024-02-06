import 'package:get/get.dart';
import 'package:movie_mania/views/first/first_controller.dart';
import 'package:movie_mania/views/request_sender/request_sender_controller.dart';
import 'package:movie_mania/models/method.dart';
import 'package:movie_mania/models/series.dart';
import 'package:movie_mania/models/user.dart';
import 'package:movie_mania/views/series/series_view.dart';
import 'package:movie_mania/views/profile_details/profile_details_view.dart';
import 'package:movie_mania/views/request_sender/request_sender_view.dart';
import 'package:movie_mania/views/searching/searching_view.dart';

class HomeController extends GetxController {
  List<Series> seriesList = [];
  User user = Get.arguments["user"] as User;

  @override
  void onReady() {
    super.onReady();
    print("homeViewController");
    Get.delete<FirstController>();
    loadData();
  }

  Future<void> loadData() async {
    var response = await Get.to(() => RequestSenderView(),
        transition: Transition.noTransition,
        arguments: {
          'method': Method.GET,
          'route': "http://localhost:3000/series",
        });
    Get.delete<RequestSenderController>();
    print(response);
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
      () => SeriesView(),
      arguments: series,
      transition: Transition.cupertino,
    );
  }

  void showSearchingView() {
    Get.to(
      () => SearchingView(),
      transition: Transition.cupertino,
    );
  }

  void showProfileView() async {
    await Get.to(
      () => ProfileDetailsView(),
      transition: Transition.cupertino,
      arguments: {"user": user},
    );
    update();
  }
}
