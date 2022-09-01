// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:login/page/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isHiddenPassword = true;
  bool isHiddenCpassword = true;

  Future<void> register() async {
    var url = Uri.parse("http://127.0.0.1:8000/api/register");
    // var url = Uri.parse("http://10.0.2.2:8000/api/register");
    var response = await http.post(url,
        body: ({
          'name': nameController.text,
          'email': emailController.text,
          'password': passController.text,
          'password_confirmation': cpassContrloller.text
        }));

    var responseData = json.decode(response.body);

    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("email berhasil didaftarkan")));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(responseData.toString())));
    }
  }

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passController = TextEditingController();
  var cpassContrloller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("register")),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SafeArea(
            child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.person)),
              ),
              SizedBox(
                height: 15,
              ),
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
                controller: passController,
                obscureText: isHiddenPassword,
                decoration: InputDecoration(
                    labelText: "password",
                    border: OutlineInputBorder(),
                    suffixIcon: InkWell(
                      onTap: _togglePasswordView,
                      child: Icon(Icons.visibility))),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: cpassContrloller,
                obscureText: isHiddenCpassword,
                decoration: InputDecoration(
                    labelText: "Confirm password",
                    border: OutlineInputBorder(),
                    suffixIcon: InkWell(
                        onTap: _toggleCPasswordView,
                        child: Icon(Icons.visibility))),
              ),
              SizedBox(
                height: 45,
              ),
              OutlinedButton.icon(
                  onPressed: () {
                    register();
                  },
                  icon: Icon(
                    Icons.login,
                    size: 18,
                  ),
                  label: Text("Register")),
              SizedBox(
                height: 15,
              ),
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Sudah Memiliki Akun? ',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                      text: 'Login',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
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
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }
  void _toggleCPasswordView() {
    setState(() {
      isHiddenCpassword= !isHiddenCpassword;
    });
  }
}
