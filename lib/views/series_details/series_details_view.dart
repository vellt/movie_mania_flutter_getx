import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_mania/controllers/details_view_controller.dart';

class DetailsView extends StatelessWidget {
  DetailsViewController controller = Get.put(DetailsViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsViewController>(
        init: controller,
        builder: (_) {
          return (controller.series == null)
              ? Scaffold(
                  backgroundColor: Colors.black,
                  body: Center(child: CircularProgressIndicator()),
                )
              : RefreshIndicator(
                  onRefresh: controller.loadData,
                  child: Scaffold(
                    backgroundColor: Colors.black,
                    appBar: AppBar(
                      backgroundColor: Colors.black,
                      title: Text(
                        controller.series!.name,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      centerTitle: true,
                      actions: [
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.edit,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: AspectRatio(
                              aspectRatio: 2.0 / 3.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  "http://localhost:3000/images/${controller.series!.image}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      controller.series!.season.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 60,
                                      ),
                                    ),
                                    Text(
                                      "seasons",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.yellow,
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  height: 80,
                                  width: 150,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        controller.series!.rating.toString(),
                                        style: TextStyle(
                                            fontSize: 35,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Icon(
                                        Icons.star,
                                        size: 35,
                                        color: Colors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: 20, right: 20, top: 20, bottom: 35),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  iconSize: 40,
                                  icon: Icon(
                                    Icons.star_border,
                                    color: Colors.yellow,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  iconSize: 40,
                                  icon: Icon(
                                    Icons.star_border,
                                    color: Colors.yellow,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  iconSize: 40,
                                  icon: Icon(
                                    Icons.star_border,
                                    color: Colors.yellow,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  iconSize: 40,
                                  icon: Icon(
                                    Icons.star_border,
                                    color: Colors.yellow,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  iconSize: 40,
                                  icon: Icon(
                                    Icons.star_border,
                                    color: Colors.yellow,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
        });
  }
}
