import 'dart:convert';
import 'dart:typed_data';
import 'package:coffeeshopapp/Model/Favouritemodel.dart';
import 'package:coffeeshopapp/Model/Product.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<List<Favouritemodel>> getfavourites() async {
  final prefs = await SharedPreferences.getInstance();
  int? user = prefs.getInt('userid');
  final url = Uri.parse(
      "http://192.168.100.104:5000/api/Favourite/getAllFavourites?userid=$user");
  final headers = {
    'Content-Type': 'application/json',
  };
  final response = await http.get(url, headers: headers);
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    print(data);
    List<Favouritemodel> products =
        data.map((item) => Favouritemodel.fromJson(item)).toList();
    print("heloooooooo\n");
    print(products);
    return products;
  } else {
    throw Exception('Failed to load Favourites');
  }
}

Future<void> addfavourite(int productId) async {
  final prefs = await SharedPreferences.getInstance();
  int? user = prefs.getInt('userid');
  final url = Uri.parse(
      "http://192.168.100.104:5000/api/Favourite/addToFavourites?productId=$productId&userid=$user");
  final headers = {
    'Content-Type': 'application/json',
  };
  final response = await http.post(url, headers: headers);
  print('Response Body: ${response.body}');

  if (response.statusCode != 200) {
    throw Exception('Failed to Add in favourites: ${response.reasonPhrase}');
  }
}

Future<String?> removeFromFavourites(int productId) async {
  final prefs = await SharedPreferences.getInstance();
  int? user = prefs.getInt('userid');
  final url = Uri.parse(
    "http://192.168.100.104:5000/api/Favourite/deletefavouriteProduct?userId=$user&productId=$productId",
  );

  final response = await http.delete(url);

  print('Response Body: ${response.body}');

  if (response.statusCode != 200) {
    throw Exception(
        'Failed to remove from favourites: ${response.reasonPhrase}');
  }
}
