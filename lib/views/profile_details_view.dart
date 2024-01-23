import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_mania/components/custom_list_tile.dart';
import 'package:movie_mania/components/custom_text_field.dart';
import 'package:movie_mania/components/profile_picture.dart';
import 'package:movie_mania/controllers/profile_details_controller.dart';

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
                        url: controller.profilePictureSource,
                        onTap: () {
                          print("katt");
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      CustomListTile(
                          prefixIcon: Icons.person,
                          mainTitle: "Username",
                          subTitle: "@JohnDoe",
                          iconButton: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                            onPressed: () {
                              Get.bottomSheet(Container(
                                child: Column(
                                  children: [
                                    CustomTextField(
                                        controller:
                                            controller.userNameController,
                                        prefixIcon:
                                            Icon(Icons.person, size: 18),
                                        labelText: "Username",
                                        padding: EdgeInsets.zero,
                                        isPassword: false),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    color: Color(0xFF272727),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    )),
                              ));
                            },
                          )),
                      CustomListTile(
                          prefixIcon: Icons.mail,
                          mainTitle: "Email",
                          subTitle: "admin@admin.com"),
                      CustomListTile(
                          prefixIcon: Icons.date_range,
                          mainTitle: "Birth Date",
                          subTitle: "2024-01-23",
                          iconButton: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                            onPressed: () {},
                          )),
                      CustomListTile(
                          prefixIcon: Icons.lock,
                          mainTitle: "Password",
                          subTitle: "*************",
                          iconButton: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                            onPressed: () {},
                          )),
                      CustomListTile(
                          prefixIcon: Icons.accessibility,
                          mainTitle: "Role",
                          subTitle: "Admin"),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          width: double.infinity,
                          child: CupertinoButton(
                            padding: EdgeInsets.zero,
                            color: Colors.red,
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Text("Delete Account"),
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      CupertinoButton(
                        child: Text("Log out"),
                        onPressed: () {},
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
