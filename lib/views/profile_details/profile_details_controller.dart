import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_mania/components/custom_bottom_sheet.dart';
import 'package:movie_mania/components/custom_button.dart';
import 'package:movie_mania/components/custom_text_field.dart';
import 'package:movie_mania/components/profile_picture.dart';
import 'package:movie_mania/models/user.dart';
import 'package:movie_mania/views/first_view.dart';

class ProfileDetailsController extends GetxController {
  User user = Get.arguments["user"] as User;

  TextEditingController userNameController = TextEditingController();
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController newPasswordAgainController = TextEditingController();

  void logOut() {
    Get.offAll(() => FirstView(), transition: Transition.cupertino);
  }

  void deleteAccount() {
    print(":(");
  }

  void loadPictureEdit() {
    Get.bottomSheet(CustomBottomSheet(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: ProfilePicture(
            url: "http://localhost:3000/images/${user.userImage}",
            onTap: () {},
          ),
        ),
        CustomButton(
          background: Colors.blue,
          text: "Save Changes",
          onPressed: () {
            print("hello");
          },
        ),
      ],
    ));
  }

  void loadUserNameEdit() {
    Get.bottomSheet(CustomBottomSheet(
      children: [
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
          onPressed: () {
            print("hello");
          },
        ),
      ],
    ));
  }

  void loadDateEdit() {
    Get.bottomSheet(
      CustomBottomSheet(
        children: [
          SizedBox(
            height: 200,
            child: CupertinoDatePicker(
              initialDateTime: user.birthday,
              mode: CupertinoDatePickerMode.date,
              dateOrder: DatePickerDateOrder.ymd,
              use24hFormat: true,
              onDateTimeChanged: (date) {
                // controller.setNewDate(date);
              },
            ),
          ),
          CustomButton(
            background: Colors.blue,
            text: "Save Changes",
            onPressed: () {
              print("hello");
            },
          ),
        ],
      ),
    );
  }

  void loadPwdEdit() {
    Get.bottomSheet(CustomBottomSheet(
      children: [
        CustomTextField(
          controller: oldPasswordController,
          prefixIcon: Icon(Icons.lock, size: 18),
          labelText: "Current Password",
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          isPassword: true,
        ),
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
          onPressed: () {
            print("hello");
          },
        ),
      ],
    ));
  }
}