import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController text1controller;
  @override
  void initState() {
    text1controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    text1controller.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text('Home'),
    ),);
    // GestureDetector(
    //   onTap: () {
    //     FocusScope.of(context).unfocus();
    //   },
    //   child: Scaffold(
    //     appBar: AppBar(
    //       title: const Text('Home'),
    //       leading: IconButton(onPressed: () {

    //       }, icon: Icon()),
    //     ),
    //   ),
    // );
  }
}
