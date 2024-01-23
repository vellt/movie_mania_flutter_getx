import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileDetailsController extends GetxController {
  String profilePictureSource =
      "https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg";
  String userName = "@JohnDoe";
  String email = "admin@admin.com";
  DateTime date = DateTime.now();
  String role = "Admin";

  TextEditingController userNameController = TextEditingController();
}
