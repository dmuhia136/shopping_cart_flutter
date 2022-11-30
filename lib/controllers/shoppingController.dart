import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shopping_app/model/shopModel.dart';
import 'package:shopping_app/screen/shoppingList.dart';
import 'package:shopping_app/service/productService.dart';

class ShoppingController extends GetxController {
  RxList shopList = RxList([]);
  RxList cart = RxList([]);
  RxDouble total = RxDouble(0.0);
  RxBool isLoading = RxBool(false);
  @override
  void onInit() {
    super.onInit();
    fetchList();
  }

  fetchList() async {
    try {
      isLoading.value = true;
      var response = await ProductService.getProducts();
      print(response);

      shopList.assignAll(response);
      isLoading.value = false;
    } catch (e, s) {
      print("${e}");
    } finally {
      isLoading.value = false;
    }
  }

  addToCart(item) async {
    if (cart.any((element) => element.id == item.id)) {
      for (int i = 0; i < cart.length; i++) {
        total.value += cart[i].price!;
      }
    } else {
      cart.add(item);
      for (int i = 0; i < cart.length; i++) {
        total.value += cart[i].price!;
      }
    }
  }

  removeItem(item) async {
    cart.remove(item);
    for (int i = 0; i < cart.length; i++) {
      total.value -= cart[i].price!;
      print(total.value);
    }
  }

  clearCart() async {
    cart.clear();
    total.value = 0.0;
  }
}
