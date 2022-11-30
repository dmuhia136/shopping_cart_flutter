import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/screen/shoppingList.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(child: Image.asset('assets/images/home_image.jpg')),
            const SizedBox(
              height: 30,
            ),
            Text(
              "Welcome to our shopping experience",
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                textStyle: Theme.of(context).textTheme.headline4,
                fontSize: 28,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Shop with us today",
              textAlign: TextAlign.center,
            ),
            Spacer(),
            InkWell(onTap: () =>{
              Get.to(ShoppingList())
            } ,
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(color: Colors.purple[400],borderRadius: BorderRadius.circular(15)),
                child: Text(
                  "Start Now",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }
}
