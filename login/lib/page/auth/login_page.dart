// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:login/page/auth/register_page.dart';

import 'package:login/providers/auth.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool ishiddenPassword = true;
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
  Duration get loginTime => Duration(milliseconds: 150);

  Future<String?> _authUserSignin() {
    return Future.delayed(loginTime).then((_) async {
      // return 'hello';
      try {
        await Provider.of<Auth>(context, listen: false)
            .signin(emailController.text, passContrloller.text);
      } catch (err) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(err.toString())));
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
                obscureText: ishiddenPassword,
                decoration: InputDecoration(
                    labelText: "password",
                    border: OutlineInputBorder(),
                    suffixIcon: InkWell(
                      onTap: toggleViewPassword, 
                      child: Icon(Icons.visibility)
                    ),
                ),
              ),
              SizedBox(
                height: 45,
              ),
              OutlinedButton.icon(
                  onPressed: () {
                    _authUserSignin().then((value) =>
                        Provider.of<Auth>(context, listen: false).tempData());
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

  void toggleViewPassword() {
    setState(() {
      ishiddenPassword = !ishiddenPassword;
    });
  }
}
