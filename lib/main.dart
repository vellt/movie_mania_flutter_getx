import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_mania/models/method.dart';
import 'package:movie_mania/views/details_view.dart';
import 'package:movie_mania/views/edit_details_view.dart';
import 'package:movie_mania/views/first_view.dart';
import 'package:movie_mania/views/home_view.dart';
import 'package:movie_mania/views/new_series_view.dart';
import 'package:movie_mania/views/profile_details_view.dart';
import 'package:movie_mania/views/request_sender_view.dart';
import 'package:movie_mania/views/search_view.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: FirstView(),
  ));
}
