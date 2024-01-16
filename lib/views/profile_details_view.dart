import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                      GestureDetector(
                        onTap: () {
                          print("katt");
                        },
                        child: Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            CircleAvatar(
                              backgroundImage:
                                  NetworkImage(controller.profilePictureSource),
                              radius: 100,
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(50)),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            child: Icon(
                              Icons.person,
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
                                "Username",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(controller.userName,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14)),
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            child: Icon(
                              Icons.mail,
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
                                "Email",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(controller.email,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14)),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            child: Icon(
                              Icons.date_range_outlined,
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
                                "Birth Date",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(controller.date.toString().split(" ")[0],
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14)),
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            child: Icon(
                              Icons.lock,
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
                                "Password",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text("************",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14)),
                            ],
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Colors.blue,
                            ),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Container(
                            height: 50,
                            width: 50,
                            child: Icon(
                              Icons.accessibility,
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
                                "Role",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Text(controller.role,
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 14)),
                            ],
                          ),
                        ),
                      ),
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
