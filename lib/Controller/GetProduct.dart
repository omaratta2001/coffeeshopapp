import 'dart:convert';
import 'dart:typed_data';
import 'package:coffeeshopapp/Model/Product.dart';
import 'package:http/http.dart' as http;

Future<List<Product>> getcoffeeproduct() async {
  final url =
      Uri.parse("http://192.168.100.104:5000/api/Product/getcoffeeProducts");
  final headers = {
    'Content-Type': 'application/json',
  };
  final response = await http.get(url, headers: headers);
  //print("helloooooo " + response.body);
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<Product> products =
        data.map((item) => Product.fromJson(item)).toList();
    return products;
  } else {
    throw Exception('Failed to load products');
  }
}

Future<List<Product>> getallproduct() async {
  final url =
      Uri.parse("http://192.168.100.104:5000/api/Product/getallProducts");
  final headers = {
    'Content-Type': 'application/json',
  };
  final response = await http.get(url, headers: headers);
  //print("helloooooo " + response.body);
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<Product> products =
        data.map((item) => Product.fromJson(item)).toList();
    return products;
  } else {
    throw Exception('Failed to load products');
  }
}

Future<List<Product>> getbeanproduct() async {
  final url =
      Uri.parse("http://192.168.100.104:5000/api/Product/getbeanProducts");
  final headers = {
    'Content-Type': 'application/json',
  };
  final response = await http.get(url, headers: headers);
  //print("helloooooo " + response.body);
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<Product> products =
        data.map((item) => Product.fromJson(item)).toList();
    return products;
  } else {
    throw Exception('Failed to load products');
  }
}
