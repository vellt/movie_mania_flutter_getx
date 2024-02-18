import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_mania/backend/backend.dart';
import 'package:movie_mania/views/series_details/series_details_view_controller.dart';

class SeriesDetailsView extends StatelessWidget {
  SeriesDetailsViewController controller = Get.put(SeriesDetailsViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SeriesDetailsViewController>(
        init: controller,
        builder: (_) {
          return (controller.loading)
              ? Scaffold(
                  body: Center(child: CircularProgressIndicator()),
                  backgroundColor: Colors.black,
                )
              : RefreshIndicator(
                  onRefresh: controller.loadData,
                  child: Scaffold(
                    backgroundColor: Colors.black,
                    appBar: AppBar(
                      backgroundColor: Colors.black,
                      title: Text(
                        controller.series.name,
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      centerTitle: true,
                    ),
                    body: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20),
                            child: ExpansionTile(
                              initiallyExpanded: controller.expanded,
                              title: Text("About the series"),
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            controller.series.season.toString(),
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
                                              controller.series.rating.toString(),
                                              style: TextStyle(fontSize: 35, color: Colors.black, fontWeight: FontWeight.bold),
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
                                (controller.user.isAdmin())
                                    ? Container()
                                    : Padding(
                                        padding: EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 35),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: List.generate(
                                            controller.icons.length,
                                            (index) => IconButton(
                                              onPressed: () => controller.sendRatingRequest(index),
                                              iconSize: 40,
                                              icon: Icon(
                                                controller.icons[index],
                                                color: Colors.yellow,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: AspectRatio(
                              aspectRatio: 2.0 / 3.0,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  "${Backend.imageBaseUrl}${controller.series.image}",
                                  fit: BoxFit.cover,
                                ),
                              ),
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
