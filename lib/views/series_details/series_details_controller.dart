import 'package:get/get.dart';
import 'package:movie_mania/controllers/request_view_controller.dart';
import 'package:movie_mania/models/method.dart';
import 'package:movie_mania/models/series.dart';
import 'package:movie_mania/views/request_sender_view.dart';

class SeriesDetailsController extends GetxController {
  Series? series;

  @override
  void onReady() {
    super.onReady();
    loadData();
  }

  Future<void> loadData() async {
    int id = (Get.arguments as Series).id;

    var response = await Get.to(() => RequestSenderView(), transition: Transition.noTransition, arguments: {
      'method': Method.GET,
      'route': "http://localhost:3000/series/$id",
    });
    print("response: $response");
    Get.delete<RequestViewController>();
    print(response);
    if (response != null) {
      int statusCode = response['statusCode'] as int;
      if (statusCode == 200) {
        var jsonData = response['json'] as List<dynamic>;
        series = jsonData.map((e) => Series.fromJson(e)).toList()[0];
        print(series!.id);
      } else
        print("error: Stats code $statusCode");
    } else
      print("error no response");
    update();
  }
}
