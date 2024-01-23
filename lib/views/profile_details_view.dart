import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                            onPressed: () {},
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

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.prefixIcon,
    required this.mainTitle,
    required this.subTitle,
    this.iconButton,
  });

  final IconData prefixIcon;
  final String mainTitle;
  final String subTitle;
  final Widget? iconButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: Container(
          height: 50,
          width: 50,
          child: Icon(
            prefixIcon,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 54, 54, 54),
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              mainTitle,
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            SizedBox(
              height: 3,
            ),
            Text(subTitle, style: TextStyle(color: Colors.grey, fontSize: 14)),
          ],
        ),
        trailing: iconButton,
      ),
    );
  }
}
