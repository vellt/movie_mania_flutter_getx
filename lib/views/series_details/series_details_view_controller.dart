import 'package:get/get.dart';
import 'package:movie_mania/backend/backend.dart';
import 'package:movie_mania/models/series.dart';

class SeriesDetailsViewController extends GetxController {
  Series series = Series.empty();
  bool loading = true;

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  Future<void> loadData() async {
    loading = true;
    update();
    int id = (Get.arguments as Series).id;
    List<dynamic> response = await Backend.GET(route: "/series/$id");
    series = response.map((e) => Series.fromJson(e)).toList()[0];
    loading = false;
    update();
  }

  void sendRatingRequest() {}
}
