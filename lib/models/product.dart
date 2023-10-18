import 'package:online_boutique/models/price_usd.dart';

class Product {
  final String id;
  final String name;
  final String description;
  final String picture;
  final PriceUsd priceUsd;
  final List<String> categories;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.picture,
    required this.priceUsd,
    required this.categories,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      picture: json['picture'],
      priceUsd: PriceUsd.fromJson(json['priceUsd']),
      categories: List<String>.from(json['categories']),
    );
  }
}
