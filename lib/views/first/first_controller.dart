import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_mania/backend/backend.dart';
import 'package:movie_mania/models/user.dart';
import 'package:movie_mania/views/home/home_view.dart';

class FirstController extends GetxController {
  // login
  TextEditingController loginEmailController = TextEditingController(text: "admin@admin.hu");
  TextEditingController loginPasswordController = TextEditingController(text: "123456aA");

  // reg
  TextEditingController regEmailController = TextEditingController();
  TextEditingController regPwdController = TextEditingController();
  TextEditingController regPwd2Controller = TextEditingController();
  TextEditingController regUsernameController = TextEditingController();

  int site = 0;

  void buttonClickEvent() {
    if (site == 0) {
      login();
    } else {
      reg();
    }
  }

  void reg() async {
    if (regPwdController.text == regPwd2Controller.text) {
      List response = await Backend.POST(route: "/regMobil", body: {
        "email": regEmailController.text,
        "username": regUsernameController.text,
        "password": regPwdController.text,
      });
      List users = response.map((e) => User.fromJson(e)).toList();
      if (users.length != 0) {
        Get.offAll(
          () => HomeView(),
          arguments: {"user": users[0]},
          transition: Transition.cupertino,
        );
      }
    } else {
      print("nem egyezik meg a jelszó");
    }
  }

  void login() async {
    List response = await Backend.POST(route: "/loginMobile", body: {
      "email": loginEmailController.text,
      "password": loginPasswordController.text,
    });
    List users = response.map((e) => User.fromJson(e)).toList();
    if (users.length != 0) {
      Get.offAll(
        () => HomeView(),
        arguments: {"user": users[0]},
        transition: Transition.cupertino,
      );
    }
  }
}
