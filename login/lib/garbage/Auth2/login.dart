// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:login/page/Auth2/register.dart';
// import 'package:login/providers/auth.dart';
// import 'package:provider/provider.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   bool ishiddenPassword = true;
  
//   Duration get loginTime => Duration(milliseconds: 150);

//   Future<String?> _authUserSignin() {
//     return Future.delayed(loginTime).then((_) async {
//       // return 'hello';
//       try {
//         await Provider.of<Auth>(context, listen: false)
//             .signin(emailController.text, passContrloller.text);
//       } catch (err) {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text(err.toString())));
//       }
//       return null;
//     });
//   }

//   var emailController = TextEditingController();
//   var passContrloller = TextEditingController();

//   //login page where you can login with your credentials
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Login'),
//         ),
//         backgroundColor: Colors.grey[200],
//         body: SafeArea(
//             child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               //icon for the app
//               Icon(
//                 Icons.account_circle,
//                 size: 150,
//                 color: Colors.blue,
//               ),

//               //hello again
//               Text(
//                 'Hello,',
//                 style: TextStyle(
//                   fontSize: 30,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'Please login to continue',
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               SizedBox(height: 50),

//               //email field
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(color: Colors.white),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 20),
//                     child: TextField(
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'email',
//                         )),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),
//               //password field
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(color: Colors.white),
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 20),
//                     child: TextField(
//                         obscureText: ishiddenPassword,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'password',
//                           suffixIcon: InkWell(
//                             onTap: toggleViewPassword, 
//                             child: Icon(Icons.visibility)
//                           ),
//                         )
//                       ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),

//               // ignore: unnecessary_new
//               new GestureDetector(
//                 onTap: () {

//                   _authUserSignin().then((value) =>
//                       Provider.of<Auth>(context, listen: false).tempData());

//                   // Navigator.push(
//                   //   context,
//                   //   MaterialPageRoute(builder: (context) => HomeStateful()),
//                   // );
//                 },
//                 //button to login
//                 child: Container(
//                   //margin side of the button
//                   margin: EdgeInsets.only(left: 20, right: 20),
//                   padding: const EdgeInsets.symmetric(horizontal: 20),
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Center(
//                     child: Text(
//                       'Login',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),

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
//                             MaterialPageRoute(builder: (context) => register()),
//                           );
//                         }),
//                 ]),
//               ),

//               //not a member? sign up button
//               // Row(
//               //   mainAxisAlignment: MainAxisAlignment.center,
//               //   // ignore: prefer_const_literals_to_create_immutables
//               //   children: [
//               //     Text(
//               //       'Not a member?',
//               //       style: TextStyle(
//               //         fontWeight: FontWeight.bold,
//               //       ),
//               //     ),
//               //     Text(
//               //       'Register now',
//               //       style: TextStyle(
//               //         color: Colors.blue,
//               //         fontWeight: FontWeight.bold,
//               //       ),
//               //     ),
//               //   ],
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
    
//   }
//   void toggleViewPassword() {
//     setState(() {
//       ishiddenPassword = !ishiddenPassword;
//     });
//   }
// }
