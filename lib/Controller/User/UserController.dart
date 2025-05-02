import 'dart:convert';

import 'package:coffeeshopapp/Model/Usermodel.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<String?> login(String email, String password) async {
  final url = Uri.parse("http://192.168.100.104:5000/api/User/login");

  try {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      final token = data['token'];
      final userid = data['userid'];

      final prefs = await SharedPreferences.getInstance();
      prefs.setString('token', token);
      prefs.setInt("userid", userid);
      return null;
    } else {
      return response.body;
    }
  } catch (e) {
    return 'Something went wrong. Please try again.';
  }
}

Future<String?> register(Usermodel user) async {
  final url = Uri.parse("http://192.168.100.104:5000/api/User/register");

  try {
    final body = jsonEncode({
      "firstName": user.firstname,
      "lastName": user.Lastname,
      "email": user.Email,
      "password": user.Password,
      "address": user.Address,
      "phone": user.phone,
      "gender": user.Gender,
    });
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    print(response.body);

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
  } catch (e) {
    return 'Something went wrong. Please try again.';
  }
}

Future<String?> getprotect() async {
  final url = Uri.parse("http://192.168.100.104:5000/api/User/protected");
  try {
    ;
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );
    print(response.body);

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
  } catch (e) {
    return 'Something went wrong. Please try again.';
  }
}
