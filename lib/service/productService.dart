import 'dart:convert';

import 'package:shopping_app/service/api_url.dart';
import 'package:shopping_app/service/service.dart';


class ProductService {
  static getProducts() async {
    var response =
        await DbBase().databaseRequest("https://fakestoreapi.com/products", DbBase().getRequestType);
    var data = jsonDecode(response);
    return data;
  }
}
