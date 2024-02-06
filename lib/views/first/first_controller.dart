import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:movie_mania/views/request_sender/request_sender_controller.dart';
import 'package:movie_mania/models/method.dart';
import 'package:movie_mania/models/user.dart';
import 'package:movie_mania/views/home/home_view.dart';
import 'package:movie_mania/views/request_sender/request_sender_view.dart';

class FirstController extends GetxController {
  // login
  TextEditingController loginEmailController =
      TextEditingController(text: "admin@admin.hu");
  TextEditingController loginPasswordController =
      TextEditingController(text: "12345aA");

  // reg
  TextEditingController regEmailController = TextEditingController();
  TextEditingController regPwdController = TextEditingController();
  TextEditingController regPwd2Controller = TextEditingController();
  TextEditingController regUsernameController = TextEditingController();

  int site = 0;

  void buttonClickEvent() {
    print(site);
    if (site == 0) {
      login();
    } else {
      reg();
    }
  }

  Future<void> reg() async {
    String uzenet = "";
    if (regPwdController.text == regPwd2Controller.text) {
      var response = await Get.to(() => RequestSenderView(),
          transition: Transition.noTransition,
          arguments: {
            'method': Method.POST,
            'route': "http://localhost:3000/regMobil",
            'body': {
              "email": regEmailController.text,
              "username": regUsernameController.text,
              "password": regPwdController.text,
            }
          });
      Get.delete<RequestSenderController>();
      if (response != null) {
        int statusCode = response['statusCode'] as int;
        print(response['json']);
        if (statusCode == 200) {
          if (response['json'] is List<dynamic>) {
            var jsonData = response['json'] as List<dynamic>;
            User user = jsonData.map((e) => User.fromJson(e)).toList()[0];
            Get.offAll(
              () => HomeView(),
              arguments: {"user": user},
              transition: Transition.cupertino,
            );
          } else {
            //üzenet érkezett
            uzenet = response['json'];
          }
        } else {
          uzenet = "error: Stats code $statusCode";
        }
      } else {
        uzenet = "error no response";
      }
    } else {
      uzenet = "nem egyezik meg a jelszó";
    }
    print(uzenet);
  }

  Future<void> login() async {
    print("login");
    var response = await Get.to(() => RequestSenderView(),
        transition: Transition.noTransition,
        arguments: {
          'method': Method.POST,
          'route': "http://localhost:3000/loginMobile",
          'body': {
            "email": loginEmailController.text,
            "password": loginPasswordController.text,
          }
        });
    Get.delete<RequestSenderController>();
    String uzenet = "";
    if (response != null) {
      int statusCode = response['statusCode'] as int;
      print(response['json']);
      if (statusCode == 200) {
        if (response['json'] is List<dynamic>) {
          var jsonData = response['json'] as List<dynamic>;
          User user = jsonData.map((e) => User.fromJson(e)).toList()[0];
          Get.offAll(
            () => HomeView(),
            arguments: {"user": user},
            transition: Transition.cupertino,
          );
        } else {
          //üzenet érkezett
          uzenet = response['json'];
        }
      } else {
        uzenet = "error: Stats code $statusCode";
      }
    } else {
      uzenet = "error no response";
    }
    print(uzenet);
  }
}
