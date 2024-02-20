import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_mania/backend/backend.dart';
import 'package:movie_mania/components/profile_picture.dart';
import 'package:movie_mania/models/user.dart';
import 'package:movie_mania/views/first/first_view.dart';

class ProfileDetailsController extends GetxController {
  User user = Get.arguments["user"] as User;
  TextEditingController userNameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController pwd2Controller = TextEditingController();
  DateTime dateTime = DateTime.now();

  // kép
  List<int> imageData = []; // kép feltöltéshez kell
  Uint8List imageMemoryData = Uint8List.fromList([]); // kép megjelenítéséhez kell
  PictureMode mode = PictureMode.Network;

  @override
  void onInit() {
    super.onInit();
    userNameController.text = user.username;
    dateTime = user.birthday;
  }

  String getProfilePictureUrl() {
    return "${Backend.imageBaseUrl}${user.userImage}?v=${Random().nextInt(1000)}";
  }

  Future readImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      var imageBytes = await file.readAsBytes();
      imageData = imageBytes.cast(); // képet tudjunk feltölteni
      imageMemoryData = imageBytes; // megjeleníteni
      mode = PictureMode.Memory; // ha sikeres a kép beolvasás akkor memory-ra állítjuk
    }
  }

  void sendEditImageRequest() async {
    if (imageData.isEmpty != true) {
      String response = await Backend.FILE(
        route: "/editUserImageMobil/${user.email}",
        image: imageData,
      );
      user.userImage = response;
      update();
      Get.back();
    }
  }

  void sendEditUsernameRequest() async {
    String uzenet = await Backend.PUT(
      route: "/editUsername/${user.email}",
      body: {"username": userNameController.text},
    );
    print(uzenet); // backend válasz kiírása
    user.username = userNameController.text; // aktualizáljuk a lokális adatainkkal
    update(); // képernyő frissítése
    Get.back(); // bottomSheet ablak bezáródjon
  }

  void sendEditDateRequest() async {
    String uzenet = await Backend.PUT(
      route: "/editBirthday/${user.email}",
      body: {"birthday": dateTime.toString().split(' ')[0]},
    );
    print(uzenet);
    // aktualizáljuk a lokális adatainkkal
    user.birthday = dateTime;
    update();
    Get.back(); // bottomSheet ablak bezáródjon
  }

  void sendEditPwdRequest() async {
    if (pwdController.text == pwd2Controller.text) {
      String uzenet = await Backend.PUT(
        route: "/editPassword/${user.email}",
        body: {"password": pwdController.text},
      );
      print(uzenet);
      Get.back(); // bottomSheet ablak bezáródjon
    }
  }

  void logOut() {
    // ### final box = GetStorage();
    // ### box.remove("email");
    Get.offAll(() => FirstView(), transition: Transition.cupertino);
  }
}
