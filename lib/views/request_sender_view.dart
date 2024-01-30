import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_mania/controllers/request_view_controller.dart';
import 'package:movie_mania/models/method.dart';

class RequestSenderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RequestViewController controller = Get.put(RequestViewController());

    return GetBuilder<RequestViewController>(
        init: controller,
        builder: (_) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
              child: (controller.loading)
                  ? CircularProgressIndicator()
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.cloud_off_outlined, size: 40),
                        ),
                        Text("Something went wrong"),
                        CupertinoButton(
                          child: Text("Refresh"),
                          onPressed: () {},
                        )
                      ],
                    ),
            ),
          );
        });
  }
}
