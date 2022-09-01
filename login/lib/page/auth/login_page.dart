// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login/page/home_page.dart';
import 'package:login/page/auth/register_page.dart';
import 'package:http/http.dart' as http;
import 'package:login/providers/auth.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // String? _token;

  // bool? get isAuth {
  //   return token != null;
  // }

  // String? get token {
  //   if (_token != null) {
  //     return _token;
  //   } else {
  //     return null;
  //   }
  // }

  // Future<void> login() async {
  //   var response = await http.post(Uri.parse("http://127.0.0.1:8000/api/login"),
  //       body: ({
  //         'email': emailController.text,
  //         'password': passContrloller.text
  //       }));

  //   var responeData = json.decode(response.body);

  //   if (response.statusCode == 201) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => HomePage()));
  //   } else {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(SnackBar(content: Text(responeData.toString())));
  //   }
  // }
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUserSignin() {
    return Future.delayed(loginTime).then((_) {
      try{
        Provider.of<Auth>(context, listen: false)
          .signin(emailController.text, passContrloller.text);
      }catch(err){
        print(err);
        return err.toString();
      }
      
      return null;
    });
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
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "password",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.password)),
              ),
              SizedBox(
                height: 45,
              ),
              OutlinedButton.icon(
                  onPressed: () {
                    // login();
                    _authUserSignin();
                    
                  },
                  icon: Icon(
                    Icons.login,
                    size: 18,
                  ),
                  label: Text("Login")),
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
}
