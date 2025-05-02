import 'dart:convert';

import 'package:coffeeshopapp/Model/Cartmodel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Cartmodel>> getcart() async {
  final prefs = await SharedPreferences.getInstance();
  int? user = prefs.getInt('userid');
  final url = Uri.parse(
      "http://192.168.100.104:5000/api/Cart/getAllCartItems?userid=$user");
  final headers = {
    'Content-Type': 'application/json',
  };
  final response = await http.get(url, headers: headers);
  print("helloooooo " + response.body);
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    List<Cartmodel> products =
        data.map((item) => Cartmodel.fromJson(item)).toList();
    return products;
  } else {
    throw Exception('Failed to load products item in Cart');
  }
}

Future<String?> addtocart(int productId, int qty) async {
  final prefs = await SharedPreferences.getInstance();
  int? user = prefs.getInt('userid');
  final url = Uri.parse(
      "http://192.168.100.104:5000/api/Cart/addtocart?userId=$user&productsizeId=$productId&qty=$qty");
  final headers = {
    'Content-Type': 'application/json',
  };
  final response = await http.post(url, headers: headers);
  if (response.statusCode == 200) {
    // final data = jsonDecode(response.body);
    // final token = data['token'];
    // final userid = data['userid'];

    // final prefs = await SharedPreferences.getInstance();
    // prefs.setString('token', token);
    // prefs.setInt("userid", userid);
    return response.body;
  } else {
    return response.body;
  }
}

Future<String?> updatecart(int productid, int qty) async {
  final prefs = await SharedPreferences.getInstance();
  int? user = prefs.getInt('userid');
  final url = Uri.parse(
      "http://192.168.100.104:5000/api/Cart/updateCartItem?userId=$user&productsizeId=$productid&qty=$qty");
  final headers = {
    'Content-Type': 'application/json',
  };
  final response = await http.put(url, headers: headers);
  if (response.statusCode == 200) {
    // final data = jsonDecode(response.body);
    // final token = data['token'];
    // final userid = data['userid'];

    // final prefs = await SharedPreferences.getInstance();
    // prefs.setString('token', token);
    // prefs.setInt("userid", userid);
    print(response.body);
    return response.body;
  } else {
    return response.body;
  }
}

Future<String?> removecart(int productid, int qty) async {
  final prefs = await SharedPreferences.getInstance();
  int? user = prefs.getInt('userid');
  final url = Uri.parse(
      "http://192.168.100.104:5000/api/Cart/deleteCartItem?userId=$user&productsizeId=$productid");
  final headers = {
    'Content-Type': 'application/json',
  };
  final response = await http.delete(url, headers: headers);
  if (response.statusCode == 200) {
    // final data = jsonDecode(response.body);
    // final token = data['token'];
    // final userid = data['userid'];

    // final prefs = await SharedPreferences.getInstance();
    // prefs.setString('token', token);
    // prefs.setInt("userid", userid);
    print(response.body);

    return response.body;
  } else {
    return response.body;
  }
}
