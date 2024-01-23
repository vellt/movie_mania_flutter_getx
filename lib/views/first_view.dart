import 'package:flut_grouped_buttons/flut_grouped_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_mania/components/custom_text_field.dart';
import 'package:movie_mania/controllers/first_view_controller.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    FirstViewController controller = Get.put(FirstViewController());
    return DefaultTabController(
      length: 2,
      child: Builder(builder: (context) {
        var _ = DefaultTabController.of(context);
        _.animation!.addListener(() {
          int index = 0;
          index = (_.indexIsChanging) ? _.index : _.animation!.value.round();
          print(index);
        });
        return GetBuilder<FirstViewController>(
            init: controller,
            builder: (_) {
              return Scaffold(
                backgroundColor: Colors.black,
                floatingActionButton: FloatingActionButton(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.navigate_next_sharp, color: Colors.white),
                  onPressed: () {},
                ),
                body: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: TabBar(
                        indicatorColor: Colors.blue,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabAlignment: TabAlignment.center,
                        tabs: [
                          Tab(
                            child:
                                Text("Login", style: TextStyle(fontSize: 20)),
                          ),
                          Tab(
                            child: Text("Registration",
                                style: TextStyle(fontSize: 20)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: TabBarView(children: [
                        Column(
                          children: [
                            CustomTextField(
                              controller: controller.loginEmailController,
                              prefixIcon: Icon(Icons.mail, size: 18),
                              labelText: "Email",
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              isPassword: false,
                            ),
                            CustomTextField(
                              controller: controller.loginPasswordController,
                              prefixIcon: Icon(Icons.lock, size: 18),
                              labelText: "Password",
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              isPassword: true,
                            ),
                            FlutGroupedButtons(
                              activeColor: Colors.blue,
                              checkColor: Colors.white,
                              isRadio: true,
                              data: ["Stay logged"],
                              onChanged: (p0) {
                                if (p0 != null) {
                                  print(true);
                                } else {
                                  print(false);
                                }
                              },
                            ),
                          ],
                        ),
                        Center(child: Text("2")),
                      ]),
                    ),
                  ],
                ),
              );
            });
      }),
    );
  }
}
