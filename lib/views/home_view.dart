import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_mania/controllers/home_view_controller.dart';

class HomeView extends StatelessWidget {
  HomeViewController controller = Get.put(HomeViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewController>(
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
                    Text(controller.userName,
                        style: TextStyle(fontSize: 20, color: Colors.white))
                  ],
                ),
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.white,
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('képre van kattintva');
                    },
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: CircleAvatar(
                        backgroundImage:
                            NetworkImage(controller.profilePicture),
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
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                        "http://localhost:3000/images/${controller.seriesList[index].image}",
                        fit: BoxFit.cover,
                      ),
                    );
                  }),
              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.blue,
                onPressed: () {},
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          );
        });
  }
}
