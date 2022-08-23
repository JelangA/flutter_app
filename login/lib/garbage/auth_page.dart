// // ignore_for_file: prefer_const_constructors, use_build_context_synchronously

// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:login/page/home_page.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   Duration get loginTime => Duration(milliseconds: 2250);

//   Future<void> login() async {
//     if (passContrloller.text.isNotEmpty && emailController.text.isNotEmpty) {
//       var response = await http.post(Uri.parse("https://reqres.in/api/login"),
//           body: ({
//             'email': emailController.text.toString(),
//             'password': passContrloller.text.toString()
//           }));
//       if (response.statusCode == 200) {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => homePage()));
//         print(response.body);
//       } else {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text("invalid")));
//       }
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text("isi data")));
//     }
//   }

//   var emailController = TextEditingController();
//   var passContrloller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Login")),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: SafeArea(
//             child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                     labelText: "Email",
//                     border: OutlineInputBorder(),
//                     suffixIcon: Icon(Icons.email)),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               TextFormField(
//                 controller: passContrloller,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                     labelText: "password",
//                     border: OutlineInputBorder(),
//                     suffixIcon: Icon(Icons.password)),
//               ),
//               SizedBox(
//                 height: 45,
//               ),
//               OutlinedButton.icon(
//                   onPressed: () {
//                     login();
//                   },
//                   icon: Icon(
//                     Icons.login,
//                     size: 18,
//                   ),
//                   label: Text("Login")),
//               SizedBox(
//                 height: 15,
//               ),
//               RichText(
//                 text: TextSpan(children: [
//                   TextSpan(
//                     text: 'Belum Daftar? ',
//                     style: TextStyle(
//                       color: Colors.black,
//                     ),
//                   ),
//                   TextSpan(
//                       text: 'Register',
//                       style: TextStyle(
//                         color: Colors.blue,
//                       ),
//                       recognizer: TapGestureRecognizer()
//                         ..onTap = () {
//                           //get register page into object
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => RegisterPage()),
//                           );
//                         }),
//                 ]),
//               ),
//             ],
//           ),
//         )),
//       ),
//     );
//   }
// }

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({Key? key}) : super(key: key);

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   var nameController = TextEditingController();
//   var emailController = TextEditingController();
//   var passContrloller = TextEditingController();
//   var cpassContrloller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("register")),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: SafeArea(
//             child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                 controller: nameController,
//                 decoration: InputDecoration(
//                     labelText: "Name",
//                     border: OutlineInputBorder(),
//                     suffixIcon: Icon(Icons.person)),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               TextFormField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                     labelText: "Email",
//                     border: OutlineInputBorder(),
//                     suffixIcon: Icon(Icons.email)),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               TextFormField(
//                 controller: passContrloller,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                     labelText: "password",
//                     border: OutlineInputBorder(),
//                     suffixIcon: Icon(Icons.password)),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               TextFormField(
//                 controller: cpassContrloller,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                     labelText: "Confirm password",
//                     border: OutlineInputBorder(),
//                     suffixIcon: Icon(Icons.password)),
//               ),
//               SizedBox(
//                 height: 45,
//               ),
//               OutlinedButton.icon(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.login,
//                     size: 18,
//                   ),
//                   label: Text("Register")),
//               SizedBox(
//                 height: 15,
//               ),
//               RichText(
//                 text: TextSpan(children: [
//                   TextSpan(
//                     text: 'Sudah Memiliki Akun? ',
//                     style: TextStyle(
//                       color: Colors.black,
//                     ),
//                   ),
//                   TextSpan(
//                       text: 'Login',
//                       style: TextStyle(
//                         color: Colors.blue,
//                       ),
//                       recognizer: TapGestureRecognizer()
//                         ..onTap = () {
//                           //get register page into object
//                           Navigator.pop(context);
//                         }),
//                 ]),
//               ),
//             ],
//           ),
//         )),
//       ),
//     );
//   }
// }
