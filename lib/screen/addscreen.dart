import 'package:carbike/modals/message.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/messagecontroller.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final messageC = Get.put(MessageController());
  final vehicleNo = TextEditingController();
  List<String> brandNameList = ["Honda", "TVS", "Suzuki", "Mahindra", "Tata"];
  List<String> vehicleTYpeList = [
    "Car",
    "Bike",
  ];
  List<String> fuelTypeList = ["Petrol", "Diesel"];

  String? brandName;
  String? vehicleType;
  String? fuelType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text("Vehicle Form"),
      ),
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Vehicle No"),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: vehicleNo,
              decoration: const InputDecoration(
                  labelText: "Vehicle No", border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButton(
              elevation: 0,
              hint: const Text("Brand Name"),
              isExpanded: true,
              value: brandName,
              items: brandNameList.map((e){
                return DropdownMenuItem(
                  value: e,
                  child: Text(e),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  brandName = value!;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            DropdownButton(
                isExpanded: true,
                elevation: 0,
                hint: const Text("Vehicle Type"),
                value: vehicleType,
                items: vehicleTYpeList
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (String? value) {
                  setState(() {
                    vehicleType = value!;
                  });

                }),
            const SizedBox(
              height: 20,
            ),
            DropdownButton(
                isExpanded: true,
                elevation: 0,
                hint: const Text("Fuel Type"),
                value: fuelType,
                items: fuelTypeList
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
                onChanged: (String? value) {
                  setState(() {
                    fuelType = value!;
                  });

                }),
            const Spacer(),
            MaterialButton(
              onPressed: () {
               if(brandName != null && vehicleType != null && fuelType!= null && vehicleNo.text.isNotEmpty){
                 messageC.addingMessage(Message(
                     id: DateTime.now().millisecondsSinceEpoch,
                     vehicleNo: vehicleNo.text.trim(),
                     brandName: brandName!,
                     vehicleType: vehicleType!,
                     fuel: fuelType!));
                 Get.back();
              }
               else{
                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("please Selected")));
               }
              },
              color: Colors.red.withOpacity(0.2),
              elevation: 0,
              minWidth: double.infinity,
              height: 50,
              child: const Text("Submit"),
            )
          ],
        ),
      )),
    );
  }
}
