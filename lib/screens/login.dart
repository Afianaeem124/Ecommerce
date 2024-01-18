// import 'dart:convert';

// import 'package:ecommerce_app/constants/colors.dart';
// import 'package:ecommerce_app/screens/forgotpassowrd.dart';
// import 'package:ecommerce_app/screens/visualsearch.dart';
// import 'package:ecommerce_app/widgets/general/appbar.dart';
// import 'package:ecommerce_app/widgets/general/buttons.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;

// class Login extends StatefulWidget {
//   const Login({Key? key}) : super(key: key);

//   @override
//   State<Login> createState() => _LoginState();
// }

// class _LoginState extends State<Login> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passController = TextEditingController();

//   bool isObsecure = true;
//   bool _isLoading = false;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         extendBodyBehindAppBar: true,
//         appBar: MyAppbar(bgColor: Colors.transparent)
//             .appbarwithback(context, "", false),
//         body: SingleChildScrollView(
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(top: 65, left: 20.0),
//                   child: Text(
//                     "Login",
//                     style: Theme.of(context).textTheme.displayLarge,
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(
//                       top: 80, left: 24, right: 25, bottom: 38),
//                   child: Column(
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.symmetric(vertical: 8.0),
//                         child: showTextField("Email Address", false,
//                             TextInputAction.next, emailController),
//                       ),
//                       showTextField("Password", isObsecure,
//                           TextInputAction.done, passController),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 15, bottom: 26),
//                         child: InkWell(
//                           onTap: () {
//                             toForgotPassword();
//                           },
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.end,
//                             children: [
//                               Text(
//                                 "Forgot your password?",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodySmall!
//                                     .copyWith(color: white6),
//                               ),
//                               Icon(
//                                 size: 24,
//                                 Icons.arrow_forward_rounded,
//                                 color: redIconwithButton,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                       CustomButton(
//                         btnName: "LOGIN ",
//                         callback: () {
//                           setState(() {
//                             _isLoading = true;
//                           });
//                           login(emailController.text, passController.text);
//                         },
//                       ),
//                       const SizedBox(
//                         height: 30,
//                       ),
//                       if (_isLoading == true) ...[
//                         // CircularProgressIndicator(
//                         //   color: redIconwithButton,
//                         // )
//                         CupertinoActivityIndicator(
//                           radius: 22,
//                           color: redIconwithButton,
//                         )
//                       ]
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget showTextField(String textHint, bool hiddenData,
//       TextInputAction moveToNextTextField, TextEditingController controller) {
//     return TextField(
//       controller: controller,
//       cursorColor: greyLabelText,

//       style: Theme.of(context).textTheme.bodySmall,
//       textInputAction: moveToNextTextField,
//       // obscureText: hiddenData,
//       decoration: InputDecoration(
//           label: Text(textHint),
//           suffixIcon: textHint.toLowerCase() == "password"
//               ? IconButton(
//                   onPressed: () {
//                     setState(() {
//                       isObsecure = !isObsecure;
//                     });
//                   },
//                   icon: Icon(hiddenData
//                       ? Icons.visibility_off_rounded
//                       : Icons.visibility_rounded))
//               : null),
//       obscureText: hiddenData,
//     );
//   }

//   void login(String email, password) async {
//     http.Response response = await http.put(
//         Uri.parse("https://ecommerce.salmanbediya.com/users/login"),
//         body: {'email': email, 'password': password});
//     var data = jsonDecode(response.body);

//     if (response.statusCode == 200) {
//       Fluttertoast.showToast(
//           msg: data['message'],
//           backgroundColor: white6,
//           textColor: Colors.black);
//       setState(() {
//         _isLoading = false;
//         toVisualSearch();
//       });
//       print(response.body);
//     } else {
//       setState(() {
//         _isLoading = false;
//       });
//       Fluttertoast.showToast(
//           msg: data['error'], backgroundColor: white6, textColor: Colors.black);
//     }
//   }

//   void toVisualSearch() {
//     Navigator.pushAndRemoveUntil(
//       context,
//       MaterialPageRoute(
//           builder: (BuildContext context) => const VisualSearch()),
//       ModalRoute.withName(' '),
//     );
//   }

//   void toForgotPassword() {
//     Navigator.push(context,
//         MaterialPageRoute(builder: (context) => const ForgotPassword()));
//   }
// }
