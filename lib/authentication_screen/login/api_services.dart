import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'login_model.dart';

class LoginService with ChangeNotifier {
  String? token;

  Future<LoginModel?> loginUser(String email, String password) async {
    final url = Uri.parse("https://bmdublog.com/TollOut/api/login");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      final result = loginModelFromJson(response.body);
      token = result.token;  // Save token if necessary
      notifyListeners();
      return result;
    } else {
      throw Exception('Failed to log in');
    }
  }
}
