import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_mania/backend/backend.dart';
import 'package:movie_mania/models/user.dart';
import 'package:movie_mania/views/home/home_view.dart';

class FirstController extends GetxController {
  // login
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();

  // reg
  TextEditingController regEmailController = TextEditingController();
  TextEditingController regPwdController = TextEditingController();
  TextEditingController regPwd2Controller = TextEditingController();
  TextEditingController regUsernameController = TextEditingController();

  int site = 0;

  void buttonClickEvent() {
    print("katt");
    if (site == 0) {
      login();
    } else {
      reg();
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _loadUser();
  }

  _loadUser() async {
    final box = GetStorage();
    print("loading data");
    //box.write("user", "jeéé");
    if (await box.hasData("email")) {
      print("van");
      String mail = await box.read("email");
      print(mail);
      getUserDataFromMail(mail);
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
        saveMail(regEmailController.text);
        loadHomeView(users[0]);
      }
    } else {
      print("nem egyezik meg a jelszó");
    }
  }

  void login() async {
    print("login");
    List response = await Backend.POST(route: "/loginMobile", body: {
      "email": loginEmailController.text,
      "password": loginPasswordController.text,
    });
    List users = response.map((e) => User.fromJson(e)).toList();
    if (users.length != 0) {
      saveMail(loginEmailController.text);
      loadHomeView(users[0]);
    }
  }

  void getUserDataFromMail(String mail) async {
    List response = await Backend.GET(route: "/getUserMobil/$mail");
    List users = response.map((e) => User.fromJson(e)).toList();
    if (users.length != 0) {
      loadHomeView(users[0]);
    }
  }

  loadHomeView(User user) {
    Get.offAll(
      () => HomeView(),
      arguments: {"user": user},
      transition: Transition.cupertino,
    );
  }

  void saveMail(String email) {
    final box = GetStorage();
    box.write("email", email);
  }
}
