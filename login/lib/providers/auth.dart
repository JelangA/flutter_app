// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  String? _idToken;

  String? _tempidToken;

  void tempData() {
    _idToken = _tempidToken;
    // userId = tempuserId;
    notifyListeners();
  }

  bool get isAuth {
    return token != null;
  }

  String? get token {
    if (_idToken != null) {
      return _idToken;
    } else {
      return null;
    }
  }

  Future<void> signin(String email, String password) async {
    Uri url = Uri.parse("http://127.0.0.1:8000/api/login");

    /// url mobile
    // Uri url = Uri.parse("http://10.0.2.2:8000/api/login");

    try {
      var response = await http.post(url,
          body: ({
            "email": email,
            "password": password,
          }));

      var responseData = json.decode(response.body);
      print(responseData);

      _tempidToken = responseData["token"];

      // tempuserId = responseData["localId"];
      //   if (responseData['error'] != null) {
      //     throw responseData['error'];
      //   }
      //   print(responseData);
      //   notifyListeners();
      // } catch (error) {
      //   rethrow;
      // }
      if (responseData['email'] != null) {
          throw responseData['email'];
        } else if (responseData['password'] != null) {
          throw responseData['password'];
        }else if(responseData['success'] == false){
          throw responseData['message'];
        }
      print(responseData);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> signup(
      String name, String email, String password, String cPassword) async {
    Uri url = Uri.parse("http://127.0.0.1:8000/api/register");

    /// url mobile
    // Uri url = Uri.parse("http://10.0.2.2:8000/api/register");

    try {
      var response = await http.post(url,
          body: ({
            "name": name,
            "email": email,
            "password": password,
            "password_confirmation": cPassword,
          }));

      var responseData = json.decode(response.body);
      print(responseData);

      if (responseData['email'] != null) {
        throw responseData['email'];
      } else if (responseData['password'] != null) {
        throw responseData['password'];
      } else {
        throw 'error';
      }
    
    } catch (error) {
      rethrow;
    }
  }
}
