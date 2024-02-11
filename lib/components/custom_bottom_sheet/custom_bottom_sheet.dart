import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_mania/components/custom_bottom_sheet/custom_bottom_sheet_controller.dart';

class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({required this.children});
  List<Widget> Function(CustomBottomSheetController) children;

  CustomBottomSheetController controller =
      Get.put(CustomBottomSheetController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomBottomSheetController>(
      init: controller,
      builder: (_) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 40,
                  child: Divider(color: Colors.white),
                ),
              ),
              Column(children: children(controller))
            ],
          ),
          decoration: BoxDecoration(
              color: Color(0xFF272727),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              )),
        );
      },
    );
  }
}
