import 'package:get/get.dart';
import 'package:shopping_app/controllers/shoppingController.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() async {
    Get.put<ShoppingController>(ShoppingController(), permanent: true);
  }
}