import 'dart:convert' show json;
import 'package:flutter/services.dart' show rootBundle;
import 'package:online_boutique/models/product.dart';

class ProductCatalog {
  Future<List<Product>> fetchProducts() async {
    final String jsonString =
        await rootBundle.loadString('assets/json/product_catalog.json');
    final List<dynamic> jsonList = json.decode(jsonString);

    await Future.delayed(const Duration(seconds: 2));

    return jsonList.map((json) => Product.fromJson(json)).toList();
  }
}
