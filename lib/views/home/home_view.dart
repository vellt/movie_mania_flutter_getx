import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_mania/views/home/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
        init: controller,
        builder: (_) {
          return RefreshIndicator(
            onRefresh: controller.loadData,
            child: Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Account",
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(controller.user.username,
                        style: TextStyle(fontSize: 20, color: Colors.white))
                  ],
                ),
                actions: [
                  IconButton(
                      onPressed: controller.showSearchingView,
                      icon: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.white,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: controller.showProfileView,
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "http://localhost:3000/images/${controller.user.userImage}?v=${Random().nextInt(100)}"),
                        radius: 20,
                      ),
                    ),
                  ),
                ],
              ),
              body: GridView.builder(
                  padding: EdgeInsets.all(20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // oszlopok száma
                    crossAxisSpacing: 20.0, // vízszintes térköz
                    mainAxisSpacing: 20.0, // függ. térköz
                    childAspectRatio: 2.0 / 3.0, // képarány
                  ),
                  itemCount: controller.seriesList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        controller
                            .showDetailsView(controller.seriesList[index]);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          "http://localhost:3000/images/${controller.seriesList[index].image}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  }),
            ),
          );
        });
  }
}
