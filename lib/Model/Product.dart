// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:coffeeshopapp/Model/Product_Size.dart';

class Product {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final String category;
  final List<String> Sizes;
  final String rates;
  final String SmallCaption;
  final String Price;
  final List<ProductSize> productSizes;

  Product(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.category,
      required this.Sizes,
      required this.rates,
      required this.SmallCaption,
      required this.Price,
      required this.productSizes});

  // factory constructor to create a Product from JSON
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      category: json['category'],
      Sizes: List<String>.from(json['sizes']),
      rates: json['rate'],
      SmallCaption: json['smallCaption'],
      Price: json['price'],
      productSizes: (json['productSizes'] as List)
          .map((e) => ProductSize.fromJson(e))
          .toList(),
    );
  }
}
