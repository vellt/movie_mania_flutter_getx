import 'dart:math';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:movie_mania/backend/backend.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_mania/components/profile_picture.dart';
import 'package:movie_mania/models/method.dart';
import 'package:movie_mania/models/user.dart';
import 'package:movie_mania/views/first/first_view.dart';

class ProfileDetailsController extends GetxController {
  User user = Get.arguments["user"] as User;
  TextEditingController userNameController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController pwd2Controller = TextEditingController();
  DateTime dateTime = DateTime.now();
  // kép
  List<int> imageData = []; // feltöltéshez
  Uint8List imageMemoryPath = Uint8List.fromList([]); // megjelenítéshez
  PictureMode mode = PictureMode.Network;

  @override
  void onInit() {
    super.onInit();
    userNameController.text = user.username;
    dateTime = user.birthday;
  }

  String getProfilePictureUrl() {
    return "${Backend.imageBaseUrl}${user.userImage}?v=${Random().nextInt(100)}";
  }

  Future readImage() async {
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      var imageBytes = await file.readAsBytes();
      imageData = imageBytes.cast();
      imageMemoryPath = await file.readAsBytes();
      mode = PictureMode.Memory; // hogy a memory értéket töltse be
    }
  }

  void sendEditImageRequest() async {
    if (!imageData.isEmpty) {
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
    print(uzenet);
    user.username = userNameController.text; // aktualizáljuk az adatot
    update(); // módosítás miatt frissítjük a nézetet
    Get.back(); // bezárjuk a bottomsheetet
  }

  void sendEditDateRequest() async {
    String uzenet = await Backend.PUT(
      route: "/editBirthday/${user.email}",
      body: {"birthday": dateTime.toString().split(' ')[0]},
    );
    print(uzenet);
    user.birthday = dateTime; // aktualizáljuk az adatot
    update(); // módosítás miatt frissítjük a nézetet
    Get.back(); // bezárjuk a bottomsheetet
  }

  void sendEditPwdRequest() async {
    if (pwdController.text == pwd2Controller.text) {
      String uzenet = await Backend.PUT(
        route: "/editPassword/${user.email}",
        body: {"password": pwd2Controller.text},
      );
      print(uzenet);
      Get.back();
    }
  }

  void logOut() {
    Get.offAll(() => FirstView(), transition: Transition.cupertino);
  }
}
