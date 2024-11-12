import 'dart:convert';
import 'package:assigment_bdm/authentication_screen/registation_screen/registatiion_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class RegistrationService with ChangeNotifier {
  Future<RegistationModel?> registerUser(String name, String email, String phone, String password) async {
    final url = Uri.parse("https://bmdublog.com/TollOut/api/registration");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({
        "name": name,
        "email": email,
        "phone": phone,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      final result = registationModelFromJson(response.body);
      notifyListeners();
      return result;
    } else {
      throw Exception('Failed to register user');
    }
  }
}
