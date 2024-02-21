import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:movie_mania/views/first/first_view.dart';

void main() async {
  await GetStorage.init();
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: FirstView(),
  ));
}
