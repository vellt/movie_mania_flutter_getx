import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FirstViewController extends GetxController {
  // login
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  bool isLogged = true;

  void setLoggedTrue() {
    isLogged = true;
  }

  void setLoggedFalse() {
    isLogged = false;
  }

  // registration
  String profilePictureSource =
      "https://t3.ftcdn.net/jpg/02/99/04/20/360_F_299042079_vGBD7wIlSeNl7vOevWHiL93G4koMM967.jpg";
  TextEditingController regEmailController = TextEditingController();
  TextEditingController regPwdController = TextEditingController();
  TextEditingController regPwd2Controller = TextEditingController();
  TextEditingController regUsernameController = TextEditingController();

  DateTime birthDate = DateTime.now();

  void setNewDate(DateTime date) {
    this.birthDate = date;
  }
}
