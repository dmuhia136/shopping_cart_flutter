import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/shoppingController.dart';
import 'package:shopping_app/model/shopModel.dart';
import 'package:shopping_app/screen/cartPage.dart';

class ShoppingList extends StatelessWidget {
  ShoppingList({super.key});
  ShoppingController shoppingController = Get.find<ShoppingController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Get.to(CartPage())},
        child: Row(
          children: [
            Icon(Icons.shopping_cart_rounded),
            Obx(() => Text("${shoppingController.cart.length}"))
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(()=>
             Column(
              children: [
                shoppingController.shopList.isEmpty
                    ? Center(child: CircularProgressIndicator.adaptive())
                    : ListView.builder(
                        itemCount: shoppingController.shopList.length,
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          PrankModelData data = PrankModelData.fromJson(
                              shoppingController.shopList.elementAt(index));
                          return Container(
                              // width: MediaQuery.of(context).size.width * 0.5,
                              height: MediaQuery.of(context).size.height * 0.5,
                              decoration: BoxDecoration(),
                              child: Stack(
                                children: [
                                  Positioned(
                                      bottom: 0,
                                      child: InkWell(
                                        onTap: () =>
                                            {shoppingController.addToCart(data)},
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                1.0,
                                            padding: EdgeInsets.all(10),
                                            decoration:
                                                BoxDecoration(color: Colors.blue),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Buy now \$${data.price}",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                              ],
                                            )),
                                      )),
                                  Column(
                                    children: [
                                      Container(
                                          height: 300,
                                          child: Image.network("${data.image}")),
                                      Text(
                                        "${data.title}",
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ],
                                  ),
                                ],
                              ));
                        })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
