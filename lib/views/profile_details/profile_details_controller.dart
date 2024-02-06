import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:path/path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_mania/components/custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:movie_mania/components/custom_button.dart';
import 'package:movie_mania/components/custom_text_field.dart';
import 'package:movie_mania/components/profile_picture.dart';
import 'package:movie_mania/models/method.dart';
import 'package:movie_mania/models/user.dart';
import 'package:movie_mania/views/first/first_view.dart';
import 'package:movie_mania/views/request_sender/request_sender_controller.dart';
import 'package:movie_mania/views/request_sender/request_sender_view.dart';

class ProfileDetailsController extends GetxController {
  User user = Get.arguments["user"] as User;

  TextEditingController userNameController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordAgainController = TextEditingController();

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    userNameController.text = user.username;
  }

  void logOut() {
    Get.offAll(() => FirstView(), transition: Transition.cupertino);
  }

  void deleteAccount() {
    print(":(");
  }

  Future<bool> updateData(String url, Map body, Method method) async {
    String uzenet = "";
    bool result = false;
    var response = await Get.to(() => RequestSenderView(),
        transition: Transition.noTransition,
        arguments: {'method': method, 'route': url, 'body': body});
    Get.delete<RequestSenderController>();
    if (response != null) {
      int statusCode = response['statusCode'] as int;
      print(response['json']);
      if (statusCode == 200) {
        uzenet = response['json'];
        result = true;
      } else {
        uzenet = "error: Stats code $statusCode";
        result = false;
      }
    } else {
      uzenet = "error no response";
      result = false;
    }
    print(uzenet);
    return result;
  }

  void loadPictureEdit() {
    List<int> listData = [];
    Uint8List? path = null;
    Get.bottomSheet(
      CustomBottomSheet(
        children: (controller) => [
          Padding(
            padding: EdgeInsets.all(20),
            child: ProfilePicture(
              filePath: path,
              url:
                  "http://localhost:3000/images/${user.userImage}?v=${Random().nextInt(100)}",
              onTap: () async {
                final file =
                    await ImagePicker().pickImage(source: ImageSource.gallery);
                if (file != null) {
                  var imageBytes = await file.readAsBytes();
                  listData = imageBytes.cast();
                  path = await file.readAsBytes();
                  controller.UpdateScreen();
                }
              },
            ),
          ),
          CustomButton(
            background: Colors.blue,
            text: "Save Changes",
            onPressed: () async {
              if (!listData.isEmpty) {
                var response = await Get.to(() => RequestSenderView(),
                    transition: Transition.noTransition,
                    arguments: {
                      'method': Method.FILE,
                      'route':
                          "http://localhost:3000/editUserImageMobil/${user.email}",
                      'body': {"path": listData}
                    });
                Get.delete<RequestSenderController>();
                if (response != null) {
                  int statusCode = response['statusCode'] as int;
                  print(response['json']);
                  if (statusCode == 200) {
                    user.userImage = response['json'] as String;
                    update();
                  }
                }
              }

              Get.back();
            },
          ),
        ],
      ),
    );
  }

  void loadUserNameEdit() {
    Get.bottomSheet(CustomBottomSheet(
      children: (controller) => [
        CustomTextField(
          controller: userNameController,
          prefixIcon: Icon(Icons.person, size: 18),
          labelText: "Username",
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          isPassword: false,
        ),
        CustomButton(
          background: Colors.blue,
          text: "Save Changes",
          onPressed: () async {
            bool result = await updateData(
              "http://localhost:3000/editUsername/${user.email}",
              {"username": userNameController.text},
              Method.PUT,
            );
            if (result) {
              user.username = userNameController.text;
              update();
            }
            Get.back();
          },
        ),
      ],
    ));
  }

  void loadDateEdit() {
    DateTime dateTime = user.birthday;
    Get.bottomSheet(
      CustomBottomSheet(
        children: (controller) => [
          SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              initialDateTime: user.birthday,
              mode: CupertinoDatePickerMode.date,
              dateOrder: DatePickerDateOrder.ymd,
              use24hFormat: true,
              onDateTimeChanged: (date) {
                dateTime = date;
              },
            ),
          ),
          CustomButton(
            background: Colors.blue,
            text: "Save Changes",
            onPressed: () async {
              bool result = await updateData(
                  "http://localhost:3000/editBirthday/${user.email}",
                  {"birthday": dateTime.toString().split(' ')[0]},
                  Method.PUT);
              if (result) {
                user.birthday = dateTime;
                update();
              }
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  void loadPwdEdit() {
    Get.bottomSheet(CustomBottomSheet(
      children: (controller) => [
        CustomTextField(
          controller: newPasswordController,
          prefixIcon: Icon(Icons.lock, size: 18),
          labelText: "new Password",
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          isPassword: true,
        ),
        CustomTextField(
          controller: newPasswordAgainController,
          prefixIcon: Icon(Icons.lock, size: 18),
          labelText: "new Password again",
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          isPassword: true,
        ),
        CustomButton(
          background: Colors.blue,
          text: "Save Changes",
          onPressed: () async {
            if (newPasswordAgainController.text == newPasswordController.text) {
              bool result = await updateData(
                  "http://localhost:3000/editPassword/${user.email}",
                  {"password": newPasswordController.text},
                  Method.PUT);
              if (result) {
                // sikeresen frissült az adb
              }
            }
            Get.back();
          },
        ),
      ],
    ));
  }
}
