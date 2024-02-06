import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_mania/models/method.dart';
import 'package:movie_mania/views/series/series_view.dart';
import 'package:movie_mania/views/first/first_view.dart';
import 'package:movie_mania/views/home/home_view.dart';
import 'package:movie_mania/views/profile_details/profile_details_view.dart';
import 'package:movie_mania/views/request_sender/request_sender_view.dart';
import 'package:movie_mania/views/searching/searching_view.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: FirstView(),
  ));
}
