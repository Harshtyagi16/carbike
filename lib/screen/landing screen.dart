import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'addscreen.dart';
import 'bikepage.dart';
import 'car.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen>
    with TickerProviderStateMixin {
  late TabController tabController;
  List<Widget> pages = [CarPage(), BikePage()];

  @override
  void initState() {
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final result = await buildShowDialog(context);
        return result ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Welcome"),
          elevation: 0,
          bottom: TabBar(controller: tabController, tabs: const [
            Tab(
              text: 'Car',
            ),
            Tab(
              text: "Bike",
            )
          ]),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: 50,
          margin: const EdgeInsets.all(10),
          child: MaterialButton(
            color: Colors.red.withOpacity(0.2),
            elevation: 0,
            onPressed: () {
              Get.to(() => const AddScreen());
            },
            child: const Center(
              child: Text('Add'),
            ),
          ),
        ),
        body: TabBarView(controller: tabController, children: pages),
      ),
    );
  }

  Future<bool?> buildShowDialog(BuildContext context) {
    return showDialog<bool>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Do you want to exit"),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text("cancel"),
              ),
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text("ok"),
              )
            ],
          );
        });
  }
}

// onWillPop: () async {
// final check = await buildShowDialog(context);
// return check ?? false;
// },
