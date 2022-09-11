// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';


// class register extends StatefulWidget {
//   const register({Key? key}) : super(key: key);

//   @override
//   State<register> createState() => _registerState();
// }

// class _registerState extends State<register> {
//   bool isHiddenPassword = true;
//   bool isHiddenCPassword = true;

//   Duration get loginTime => Duration(milliseconds: 2250);

//   Future<String?> _authUserSignup() {
//     return Future.delayed(loginTime).then((_) async {
//       try {
//         await Provider.of<Auth>(context, listen: false).signup(
//             nameController.text,
//             emailController.text,
//             passController.text,
//             cpassContrloller.text);
//       } catch (err) {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text(err.toString())));
//       }

//       return null;
//     });
//   }

//   var nameController = TextEditingController();
//   var emailController = TextEditingController();
//   var passController = TextEditingController();
//   var cpassContrloller = TextEditingController();

//   //register page where you can register with your credentials
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Register'),
//       ),
//       backgroundColor: Colors.grey[200],
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               //Nama
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
//                       decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: 'nama',
//                     ),),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),

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
//                       border: InputBorder.none,
//                       hintText: 'Email',
//                     )),
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
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'password',
//                         )),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 10),

//               //confirm password
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
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: 'confirm Password',
//                         )),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),

//               //login button
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Container(
//                   width: double.infinity,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     color: Colors.blue,
//                     borderRadius: BorderRadius.circular(12),
//                   ),
//                   child: Center(
//                     child: Text(
//                       'Register',
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
//                     text: 'Sudah memiliki akun? ',
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
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
