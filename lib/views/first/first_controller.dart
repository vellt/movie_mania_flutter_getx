import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_mania/backend/backend.dart';
import 'package:movie_mania/models/user.dart';
import 'package:movie_mania/views/home/home_view.dart';

class FirstController extends GetxController {
  // login
  TextEditingController loginEmailController = TextEditingController(text: "admin@admin.hu");
  TextEditingController loginPasswordController = TextEditingController(text: "12345aA");

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

  @override
  void onInit() {
    super.onInit();
    loadUser();
  }

  void reg() async {
    if (regPwdController.text == regPwd2Controller.text) {
      List response = await Backend.POST(route: "/regMobil", body: {
        "email": regEmailController.text,
        "username": regUsernameController.text,
        "password": regPwd2Controller.text,
      });
      List users = response.map((e) => User.fromJson(e)).toList();
      if (users.length != 0) {
        // sikeres reg
        saveMyMail(regEmailController.text);
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
    // amikor a length nem 0
    if (users.length != 0) {
      // sikeres bejeltkezés
      saveMyMail(loginEmailController.text);
      Get.offAll(
        () => HomeView(),
        arguments: {"user": users[0]}, // az első elem a talált felhasználó
        transition: Transition.cupertino,
      );
    }
  }

  // sikeres login/reg után elmenti az email címemet
  void saveMyMail(String mail) {
    final box = GetStorage();
    box.write("email", mail);
  }

  // keresi, hogy van-e lementve email adat
  // kinyeri, hogy van-e olyan felhasználó, aki már
  // egyszer bejelentkezett, de még nem jelentkezett ki
  void loadUser() async {
    final box = GetStorage();
    print("loading user data");
    if (await box.hasData("email")) {
      String mail = await box.read("email");
      loginWithEmail(mail);
    }
  }

  // automatikusan bejelentkeztet egy felhasználót
  void loginWithEmail(String mail) async {
    List response = await Backend.Get(route: '/getUserMobil/$mail');
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
