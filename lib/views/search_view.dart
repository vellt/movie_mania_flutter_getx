import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_mania/components/custom_text_field.dart';
import 'package:movie_mania/controllers/home_view_controller.dart';
import 'package:movie_mania/controllers/search_view_controller.dart';

class SearchView extends StatelessWidget {
  SearchViewController controller = Get.put(SearchViewController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchViewController>(
        init: controller,
        builder: (_) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: Text("Search"),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.white,
                    )),
              ],
              bottom: PreferredSize(
                preferredSize: Size(double.infinity, 60),
                child: CustomTextField(
                  controller: controller.searchController,
                  prefixIcon: Icon(Icons.search, size: 18),
                  labelText: "Type some words..",
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  isPassword: false,
                ),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off,
                    size: 50,
                    color: Colors.grey,
                  ),
                  Text(
                    "No results.",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
