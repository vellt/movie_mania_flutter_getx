import 'package:get/get.dart';
import 'package:movie_mania/models/method.dart';
import 'package:movie_mania/models/series.dart';
import 'package:movie_mania/views/request_sender_view.dart';

class HomeViewController extends GetxController {
  List<Series> seriesList = [];
  String userName = "JohnDoe";
  String profilePicture =
      "https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg";
  List<String> filmBoritoUrlList = [
    "https://media.port.hu/images/001/612/350x510/784.webp",
    "https://lumiere-a.akamaihd.net/v1/images/p_disneymovies_avatarthewayofwater_streamingupdate_2096_0908fa1b.jpeg",
    "https://lumiere-a.akamaihd.net/v1/images/p_junglecruise_21740_v2_bb7f0ae4.jpeg",
    "https://media.port.hu/images/001/612/350x510/784.webp",
    "https://lumiere-a.akamaihd.net/v1/images/p_disneymovies_avatarthewayofwater_streamingupdate_2096_0908fa1b.jpeg",
    "https://lumiere-a.akamaihd.net/v1/images/p_junglecruise_21740_v2_bb7f0ae4.jpeg",
    "https://media.port.hu/images/001/612/350x510/784.webp",
    "https://lumiere-a.akamaihd.net/v1/images/p_disneymovies_avatarthewayofwater_streamingupdate_2096_0908fa1b.jpeg",
    "https://lumiere-a.akamaihd.net/v1/images/p_junglecruise_21740_v2_bb7f0ae4.jpeg",
  ];

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    Response response = await Get.to(
      RequestSenderView(
        method: Method.GET,
        route: "http://localhost:3000/series",
      ),
      transition: Transition.noTransition,
    );
  }
}
