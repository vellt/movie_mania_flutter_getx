import 'package:get/get.dart';
import 'package:movie_mania/models/series.dart';

class DetailsViewController extends GetxController {
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    title = (Get.arguments as Series).name;
    avg = (Get.arguments as Series).rating;
    seasons = (Get.arguments as Series).season;
    coverImage =
        "http://localhost:3000/images/${(Get.arguments as Series).image}";
    update();
  }

  String title = "Moonlight";
  double avg = 2.5;
  int rating = 0;
  int seasons = 12;
  String coverImage = "https://media.port.hu/images/001/612/350x510/784.webp";
}
