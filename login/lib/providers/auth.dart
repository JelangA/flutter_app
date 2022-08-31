import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  void signin(String email, String password) async {
    Uri url = Uri.parse("https://reqres.in/api/login");

    var response = await http.post(url,
        body: ({
          "email": email,
          "password": password,
        }));

    print(json.decode(response.body));
  }

  signup(String name, String email, String password, String cPassword) async {
    Uri url = Uri.parse("https://reqres.in/api/register");

    var response = await http.post(url,
        body: ({
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": cPassword,
        }));

    print(json.decode(response.body));
  }
}
