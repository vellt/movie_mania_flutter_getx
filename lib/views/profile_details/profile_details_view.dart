import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:movie_mania/backend/backend.dart';
import 'package:movie_mania/components/custom_bottom_sheet/custom_bottom_sheet.dart';
import 'package:movie_mania/components/custom_button.dart';
import 'package:movie_mania/components/custom_list_tile.dart';
import 'package:movie_mania/components/custom_text_field.dart';
import 'package:movie_mania/components/profile_picture.dart';
import 'package:movie_mania/views/profile_details/profile_details_controller.dart';

class ProfileDetailsView extends StatelessWidget {
  ProfileDetailsController controller = Get.put(ProfileDetailsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileDetailsController>(
        init: controller,
        builder: (_) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: Text("Profile details"),
              centerTitle: true,
              backgroundColor: Colors.black,
            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Column(
                    children: [
                      ProfilePicture(
                        filePath: controller
                            .imageMemoryPath, // ez a memória kép lenne
                        pictureMode: PictureMode
                            .Network, // itt mindig a netest használom
                        url: controller.getProfilePictureUrl(),
                        size: 120,
                        onTap: () {
                          controller.mode = PictureMode.Network;
                          Get.bottomSheet(
                            CustomBottomSheet(
                              children: (bottomSheetController) => [
                                Padding(
                                  padding: EdgeInsets.all(20),
                                  child: ProfilePicture(
                                    pictureMode: controller.mode,
                                    filePath: controller.imageMemoryPath,
                                    url: controller.getProfilePictureUrl(),
                                    onTap: () async {
                                      await controller.readImage();
                                      // csak a bottomsheet nézetét frissítem
                                      bottomSheetController.Update();
                                    },
                                  ),
                                ),
                                CustomButton(
                                  background: Colors.blue,
                                  text: "Save Changes",
                                  onPressed: controller.sendEditImageRequest,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomListTile(
                          prefixIcon: Icons.person,
                          mainTitle: "Username",
                          subTitle: "@${controller.user.username}",
                          iconButton: IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              Get.bottomSheet(CustomBottomSheet(
                                children: (_) => [
                                  CustomTextField(
                                    controller: controller.userNameController,
                                    prefixIcon: Icon(Icons.person, size: 18),
                                    labelText: "Username",
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    isPassword: false,
                                  ),
                                  CustomButton(
                                    background: Colors.blue,
                                    text: "Save Changes",
                                    onPressed:
                                        controller.sendEditUsernameRequest,
                                  ),
                                ],
                              ));
                            },
                          )),
                      CustomListTile(
                          prefixIcon: Icons.mail,
                          mainTitle: "Email",
                          subTitle: controller.user.email),
                      CustomListTile(
                          prefixIcon: Icons.date_range,
                          mainTitle: "Birth Date",
                          subTitle:
                              controller.user.birthday.toString().split(' ')[0],
                          iconButton: IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              Get.bottomSheet(
                                CustomBottomSheet(
                                  children: (_) => [
                                    SizedBox(
                                      height: 200,
                                      child: CupertinoDatePicker(
                                          initialDateTime:
                                              controller.user.birthday,
                                          mode: CupertinoDatePickerMode.date,
                                          dateOrder: DatePickerDateOrder.ymd,
                                          use24hFormat: true,
                                          onDateTimeChanged: (date) {
                                            controller.dateTime = date;
                                          }),
                                    ),
                                    CustomButton(
                                      background: Colors.blue,
                                      text: "Save Changes",
                                      onPressed: controller.sendEditDateRequest,
                                    ),
                                  ],
                                ),
                              );
                            },
                          )),
                      CustomListTile(
                          prefixIcon: Icons.lock,
                          mainTitle: "Password",
                          subTitle: "*************",
                          iconButton: IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: () {
                              Get.bottomSheet(CustomBottomSheet(
                                children: (_) => [
                                  CustomTextField(
                                    controller: controller.pwdController,
                                    prefixIcon: Icon(Icons.lock, size: 18),
                                    labelText: "new Password",
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    isPassword: true,
                                  ),
                                  CustomTextField(
                                    controller: controller.pwd2Controller,
                                    prefixIcon: Icon(Icons.lock, size: 18),
                                    labelText: "new Password again",
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 10),
                                    isPassword: true,
                                  ),
                                  CustomButton(
                                    background: Colors.blue,
                                    text: "Save Changes",
                                    onPressed: controller.sendEditPwdRequest,
                                  ),
                                ],
                              ));
                            },
                          )),
                      CustomListTile(
                          prefixIcon: Icons.accessibility,
                          mainTitle: "Role",
                          subTitle: (controller.user.role == 0)
                              ? "Felhasználó"
                              : "Admin"),
                      SizedBox(
                        height: 10,
                      ),
                      CustomButton(
                        background: Colors.red,
                        text: "Log out",
                        onPressed: controller.logOut,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
