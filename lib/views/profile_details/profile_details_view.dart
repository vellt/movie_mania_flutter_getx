import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_mania/components/custom_button.dart';
import 'package:movie_mania/components/custom_list_tile.dart';
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
                          url:
                              "http://localhost:3000/images/${controller.user.userImage}",
                          onTap: controller.loadPictureEdit),
                      SizedBox(
                        height: 30,
                      ),
                      CustomListTile(
                          prefixIcon: Icons.person,
                          mainTitle: "Username",
                          subTitle: "@${controller.user.username}",
                          iconButton: IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: controller.loadUserNameEdit,
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
                            onPressed: controller.loadDateEdit,
                          )),
                      CustomListTile(
                          prefixIcon: Icons.lock,
                          mainTitle: "Password",
                          subTitle: "*************",
                          iconButton: IconButton(
                            icon: Icon(Icons.edit, color: Colors.blue),
                            onPressed: controller.loadPwdEdit,
                          )),
                      CustomListTile(
                          prefixIcon: Icons.accessibility,
                          mainTitle: "Role",
                          subTitle: (controller.user.role == 0)
                              ? "Felhasználó"
                              : "Admin"),
                      CustomButton(
                        background: Colors.red,
                        text: "Delete Account",
                        onPressed: controller.deleteAccount,
                      ),
                      CupertinoButton(
                        child: Text("Log out"),
                        onPressed: controller.logOut,
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
