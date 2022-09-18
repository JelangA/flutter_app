// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, unnecessary_new

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
  String? _idToken;
  String? _tempidToken;

  bool isHiddenPassword = true;

  void tempData() {
    _idToken = _tempidToken;
    // userId = tempuserId;
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


  Future<void> login() async {
    var response = await http.post(Uri.parse("http://127.0.0.1:8000/api/login"),

        ///url mobile
        // var response = await http.post(Uri.parse("http://10.0.2.2:8000/api/login"),

        body: ({
          'email': emailController.text,
          'password': passContrloller.text
        }));

    var responeData = json.decode(response.body);

    _tempidToken = responeData['token'];

    if (responeData['success'] == true) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    } else if (responeData['email'] != null) {
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(responeData['email'].toString())));
    }else if (responeData['password'] != null) {
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(responeData['password'].toString())));
    }else if(responeData['success'] == false){
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(responeData['message'].toString())));
    } else {
        ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(responeData['error'].toString())));
    }

    }

  var emailController = TextEditingController();
  var passContrloller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      backgroundColor: Colors.grey[200],
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.account_circle,
                  size: 150,
                  color: Colors.blue,
                ),
                //hello again
                Text(
                  'Hello,',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Please login to continue',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 40),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.account_box)),
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
                        child: Icon(Icons.visibility)),
                  ),
                ),
                SizedBox(
                  height: 45,
                ),

                new GestureDetector(
                  onTap: () {
                  },

                  //button to login
                  child: Container(
                    //margin side of the button
                    margin: EdgeInsets.only(left: 20, right: 20),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                RichText(
                  text: TextSpan(
                    children: [
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegisterPage(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
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
