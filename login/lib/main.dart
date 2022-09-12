// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:login/page/auth/login_page.dart';
import 'package:login/page/home_page.dart';

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
          create: (ctx) => Auth(),
        ),
      ],
      builder: (context, child) => Consumer<Auth>(
        builder: (context, auth, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: auth.isAuth ? HomePage() : LoginPage(),
          
          // routes: {
          //   AddProductPage.route: (ctx) => AddProductPage(),
          //   EditProductPage.route: (ctx) => EditProductPage(),
          // },
        ),
      ),
    );
  }
}
