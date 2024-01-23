import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FirstView extends StatelessWidget {
  const FirstView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Builder(builder: (context) {
        var _ = DefaultTabController.of(context);
        _.animation!.addListener(() {
          int index = 0;
          index = (_.indexIsChanging) ? _.index : _.animation!.value.round();
          print(index);
        });
        return Scaffold(
          backgroundColor: Colors.black,
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            child: Icon(Icons.navigate_next_sharp, color: Colors.white),
            onPressed: () {},
          ),
          body: Column(
            children: [
              TabBar(
                tabs: [
                  Tab(
                    child: Text("Login", style: TextStyle(fontSize: 20)),
                  ),
                  Tab(
                    child: Text("Registration", style: TextStyle(fontSize: 20)),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(children: [
                  Center(child: Text("1")),
                  Center(child: Text("2")),
                ]),
              ),
            ],
          ),
        );
      }),
    );
  }
}
