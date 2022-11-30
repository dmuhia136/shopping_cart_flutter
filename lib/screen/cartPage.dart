import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/shoppingController.dart';
import 'package:shopping_app/model/shopModel.dart';

class CartPage extends StatelessWidget {
  CartPage({super.key});
  ShoppingController shoppingController = Get.find<ShoppingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
          onPressed: () => {shoppingController.clearCart()},
          child: Icon(
            Icons.clear_all,
            color: Colors.red[400],
          )),
      bottomNavigationBar: Container(
          decoration: BoxDecoration(color: Colors.greenAccent),
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Obx(()=>
                 Text(
                  "Proceed to payment \$${shoppingController.total.value!.toStringAsFixed(2)}",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          )),
      body: Obx(
        () => ListView.builder(
            itemCount: shoppingController.cart.length,
            itemBuilder: (context, index) {
              // PrankModelData data = PrankModelData.fromJson(
              //     shoppingController.cart.elementAt(index));
              var data = shoppingController.cart.elementAt(index);
              return ListTile(
                leading: Container(
                    width: 50,
                    height: 50,
                    child: Image.network("${data.image}")),
                title: Text("${data.title}"),
                subtitle: Text("\$${data.price}"),
                trailing: IconButton(
                    onPressed: () => {shoppingController.removeItem(data)},
                    icon: Icon(Icons.cancel_rounded)),
              );
            }),
      ),
    );
  }
}
