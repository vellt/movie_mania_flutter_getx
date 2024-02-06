import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_mania/components/custom_text_field.dart';
import 'package:movie_mania/views/searching/searching_controller.dart';

class SearchingView extends StatelessWidget {
  SearchingController controller = Get.put(SearchingController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchingController>(
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
                  onSubmitted: (_) => controller.loadData(),
                  controller: controller.searchController,
                  prefixIcon: Icon(Icons.search, size: 18),
                  labelText: "Type some words..",
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  isPassword: false,
                ),
              ),
            ),
            body: (controller.seriesList.length == 0)
                ? Center(
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
                  )
                : GridView.builder(
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
          );
        });
  }
}
