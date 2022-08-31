// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:login/page/home_page.dart';
import 'package:login/page/login_page.dart';
import 'package:login/providers/auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Auth()
        )
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
        // routes: {},
      ),
    );
  }
}
