import 'package:get/get.dart';

import '../modals/message.dart';

class MessageController extends GetxController {
  RxList<Message> messageList = <Message>[].obs;

  void addingMessage(Message message) {
    messageList.add(
      Message(
        id: message.id,
        vehicleNo: message.vehicleNo,
        brandName: message.brandName,
        vehicleType: message.vehicleType,
        fuel: message.fuel,
      ),
    );
    update();
  }

  void delete(int i){
    messageList.removeWhere((element) => element.id == i);
    update();
  }

  List<Message> onlyCars(){
    List<Message> output = messageList.where((p) => p.vehicleType=="Car").toList();
    update();
    return output;
  }

  List<Message> onlyBike(){
    List<Message> output = messageList.where((r) =>r.vehicleType == "Bike").toList();
    update();
    return output;
  }
}
