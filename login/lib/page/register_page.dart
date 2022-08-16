// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}
  
class _RegisterState extends State<Register> {

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passContrloller = TextEditingController();
  var cpassContrloller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

              TextFormField(
                controller: cpassContrloller,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Confirm password",
                    border: OutlineInputBorder(),
                    suffixIcon: Icon(Icons.password)),
              ),
              SizedBox(
                height: 45,),


              OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.login,
                    size: 18,
                  ),
                  label: Text("Login")),

              OutlinedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.login,
                    size: 18,
                  ),
                  label: Text("Register")
              ),
            ],
          ),
        )),
      ),
    );
  }
}