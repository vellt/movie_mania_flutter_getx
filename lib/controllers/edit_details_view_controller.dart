import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class EditDetailsViewController extends GetxController {
  String title = "Moonlight";
  int seasons = 12;
  String coverImage = "https://media.port.hu/images/001/612/350x510/784.webp";

  TextEditingController titleController = TextEditingController();

  void noveles() {
    seasons++;
    update();
  }

  void csokkentes() {
    if (seasons - 1 != 0) {
      seasons--;
      update();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    titleController.text = title;
    titleController.addListener(() {
      title = titleController.text;
      update();
    });
  }
}
