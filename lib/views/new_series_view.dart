import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_mania/controllers/details_view_controller.dart';
import 'package:movie_mania/controllers/edit_details_view_controller.dart';
import 'package:movie_mania/controllers/new_series_view_controller.dart';

class NewSeriesView extends StatelessWidget {
  NewSeriesViewController controller = Get.put(NewSeriesViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NewSeriesViewController>(
        init: controller,
        builder: (_) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text(
                "Add new series",
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
                    Icons.save,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20, right: 20, left: 20),
                    child: TextField(
                      controller: controller.titleController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.movie),
                        prefixIconColor: Colors.grey,
                        labelText: "Name",
                        labelStyle: TextStyle(color: Colors.white),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: AspectRatio(
                      aspectRatio: 2.0 / 3.0, // képarány
                      child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: Radius.circular(12),
                        dashPattern: [6],
                        color: Colors.grey,
                        strokeWidth: 3,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          child: Container(
                            child: Center(
                              child: Icon(
                                Icons.photo_size_select_actual_rounded,
                                color: Colors.grey,
                                size: 60,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  CupertinoButton.filled(
                    child: Text("Upload Image"),
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        child: IconButton(
                            onPressed: controller.csokkentes,
                            iconSize: 40,
                            icon: Icon(
                              Icons.remove,
                              color: Colors.white,
                            )),
                        decoration: BoxDecoration(
                          color: Color(0xFF333333),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      Text(
                        controller.seasons.toString(),
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                      Container(
                        child: IconButton(
                            onPressed: controller.noveles,
                            iconSize: 40,
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            )),
                        decoration: BoxDecoration(
                          color: Color(0xFF333333),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          );
        });
  }
}
