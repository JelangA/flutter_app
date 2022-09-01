// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login/page/home_page.dart';
import 'package:login/page/register_page.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static String? token;
  bool isHiddenPassword = true;

  Future<void> login() async {
    var response = await http.post(Uri.parse("http://127.0.0.1:8000/api/login"),
        // var response = await http.post(Uri.parse("http://10.0.2.2:8000/api/login"),
        body: ({
          'email': emailController.text,
          'password': passContrloller.text
        }));

    var responeData = json.decode(response.body);

    token = responeData['token'];
   

    if (responeData['success'] == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else if (responeData['success'] == false) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(responeData['message'].toString())));
    }
  }

  var emailController = TextEditingController();
  var passContrloller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.email)),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: passContrloller,
                obscureText: isHiddenPassword,
                decoration: InputDecoration(
                    labelText: "password",
                    border: OutlineInputBorder(),
                    suffixIcon: InkWell(
                        onTap: _togglePasswordView,
                        child: Icon(Icons.visibility))),
              ),
              SizedBox(
                height: 45,
              ),
              OutlinedButton.icon(
                  onPressed: () {
                    login();
                  },
                  icon: Icon(
                    Icons.login,
                    size: 18,
                  ),
                  label: Text("Login")),
              SizedBox(
                height: 15,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Belum Daftar? ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                      text: 'Register',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          //get register page into object
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegisterPage()),
                          );
                        }),
                ]),
              ),
            ],
          ),
        )),
      ),
    );
  }

  void _togglePasswordView() {
    // if (isHiddenPassword == true) {
    //   isHiddenPassword = false;
    // } else {
    //   isHiddenPassword = true;
    // }
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
}
