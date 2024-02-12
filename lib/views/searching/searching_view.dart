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
              bottom: PreferredSize(
                preferredSize: Size(double.infinity, 60),
                child: CustomTextField(
                  controller: controller.searchController,
                  prefixIcon: Icon(Icons.search, size: 18),
                  labelText: "Type some words..",
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  isPassword: false,
                  onSubmitted: (_) => controller.loadData(),
                ),
              ),
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
                      controller.showDetailsView(controller.seriesList[index]);
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
          );
        });
  }
}
