import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_mania/views/first/first_view.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: FirstView(),
  ));
}
