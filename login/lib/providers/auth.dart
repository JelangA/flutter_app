// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Auth with ChangeNotifier {
  Future<void> signin(String email, String password) async {
    Uri url = Uri.parse("http://127.0.0.1:8000/api/login");

    //// url untuk mobile
    // Uri url = Uri.parse("http://10.0.2.2:8000/api/login");

    try{
      var response = await http.post(url,
        body: ({
          "email": email,
          "password": password,
        }));

      var responseData = json.decode(response.body);

        if (responseData['success'] == false) {
        throw responseData['message'];
      }
    }catch(error){
      throw error;
    }

    

    // print(responseData);
  }

  Future<void> signup(
      String name, String email, String password, String cPassword) async {
    Uri url = Uri.parse("http://127.0.0.1:8000/api/register");

    //// url untuk mobile
    // Uri url = Uri.parse("http://10.0.2.2:8000/api/register");


    try{
       var response = await http.post(url,
        body: ({
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": cPassword,
        }));

      var responseData = json.decode(response.body);

      if (responseData['success'] == false) {
        throw responseData['message'];
      }

    // print(responseData);

    }catch(error){
      throw error;
    }

   
  }
}
