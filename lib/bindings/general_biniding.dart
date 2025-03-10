import 'package:e_commerce/features/utils/network/network_manager.dart';
import 'package:get/get.dart';

class GeneralBiniding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NetworkManager()); 
  }
}
