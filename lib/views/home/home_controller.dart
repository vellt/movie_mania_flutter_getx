import 'package:get/get.dart';
import 'package:movie_mania/controllers/request_view_controller.dart';
import 'package:movie_mania/models/method.dart';
import 'package:movie_mania/models/series.dart';
import 'package:movie_mania/views/series_details/series_details_view.dart';
import 'package:movie_mania/views/request_sender_view.dart';
import 'package:movie_mania/views/searching/searching_view.dart';

class HomeController extends GetxController {
  List<Series> seriesList = [];
  String userName = "JohnDoe";
  String profilePicture = "https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg";

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  Future<void> loadData() async {
    var response = await Get.to(() => RequestSenderView(), transition: Transition.noTransition, arguments: {
      'method': Method.GET,
      'route': "http://localhost:3000/series",
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

  void showSearchView() {
    Get.to(
      () => SearchingView(),
      transition: Transition.cupertino,
    );
  }
}
