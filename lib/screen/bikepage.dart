import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/messagecontroller.dart';

class BikePage extends StatelessWidget {
  BikePage({Key? key}) : super(key: key);
  final messageC = Get.put(MessageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Obx(
          () => messageC.onlyBike().isEmpty
              ? const Center(
                  child: Text("Hey! Add Vehicle"),
                )
              : ListView.builder(
                  itemCount: messageC.onlyBike().length,
                  itemBuilder: (ctx, i) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(15)),
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.only(bottom: 20),
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text("Vehicle Data"),
                              const Spacer(),
                              IconButton(
                                  onPressed: () {}, icon: const Icon(Icons.close))
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Wrap(spacing: 5, children: [
                            Chip(label: Text(messageC.onlyBike()[i].brandName)),
                            Chip(
                                label:
                                    Text(messageC.onlyBike()[i].vehicleType)),
                            Chip(label: Text(messageC.onlyBike()[i].vehicleNo)),
                            Chip(label: Text(messageC.onlyBike()[i].fuel)),
                          ]),
                        ],
                      ),
                    );
                  }),
        ),
      ),
    );
  }
}
