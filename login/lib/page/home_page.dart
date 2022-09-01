// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:login/page/login_page.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  Future<void> logout() async {
    var response = await http.post(
        Uri.parse("http://127.0.0.1:8000/api/logout"),
        // var response = await http.post(Uri.parse("http://10.0.2.2:8000/api/login"),
        headers: ({}));
    // if (responeData['success'] == true) {
    //   Navigator.push(
    //       context, MaterialPageRoute(builder: (context) => HomePage()));
    // } else if (responeData['success'] == false) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text(responeData['message'].toString())));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: OutlinedButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.login,
            size: 18,
          ),
          label: Text("Register")),
    ));
  }
}
