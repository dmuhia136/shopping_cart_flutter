import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/bindings.dart';
import 'package:shopping_app/screen/homeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Shopping App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialBinding: AuthBinding(),
      home: const HomeScreen(),
    );
  }
}
