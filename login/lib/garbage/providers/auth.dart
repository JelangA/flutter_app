import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier{

  void signin(String email, String password) async {

    Uri url = Uri.parse("https://reqres.in/api/users?page=2");

    var response = await http.post(url, body: jsonEncode({
      "email": email,
      "password":password,
    }));

    print(json.decode(response.body));
  }

  signup(String name, String email, String password, String cPassword) async {

    Uri url = Uri.parse("http://127.0.0.1:8000/api/register");

    var response = await http.post(url, body: jsonEncode({
      "name": name,
      "email": email,
      "password":password,
      "password_confirmation": cPassword,
    }));

    print(json.decode(response.body));
  }
}