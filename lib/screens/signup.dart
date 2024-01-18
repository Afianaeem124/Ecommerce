// import 'dart:convert';
// import 'package:ecommerce_app/constants/colors.dart';
// import 'package:ecommerce_app/screens/login.dart';
// import 'package:ecommerce_app/widgets/general/appbar.dart';
// import 'package:ecommerce_app/widgets/general/buttons.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:http/http.dart' as http;

// class SignUp extends StatefulWidget {
//   const SignUp({Key? key}) : super(key: key);

//   @override
//   State<SignUp> createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passController = TextEditingController();

//   bool _isLoading = false;
//   bool isObsecure = true;
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
//                     "Sign Up",
//                     style: Theme.of(context).textTheme.displayLarge,
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(
//                       top: 80, left: 24, right: 25, bottom: 38),
//                   child: Column(
//                     children: [
//                       showTextField(
//                           "Name", false, TextInputAction.next, nameController),
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
//                             toLoginPage();
//                           },
                      //     child: Row(
                      //       mainAxisAlignment: MainAxisAlignment.end,
                      //       children: [
                      //         Text(
                      //           "Already have an accoun?",
                      //           style: Theme.of(context)
                      //               .textTheme
                      //               .bodySmall!
                      //               .copyWith(color: white6),
                      //         ),
                      //         Icon(
                      //           size: 24,
                      //           Icons.arrow_forward_rounded,
                      //           color: redIconwithButton,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
//                       CustomButton(
//                         btnName: "SIGN UP",
//                         callback: () {
//                           setState(() {
//                             _isLoading = true;
//                           });
//                           signUp(nameController.text, emailController.text,
//                               passController.text);
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

//   void signUp(String name, String email, String password) async {
    // http.Response response = await http.post(
    //     Uri.parse("https://ecommerce.salmanbediya.com/users/register"),
    //     body: {'name': name, 'email': email, 'password': password});
    // var data = jsonDecode(response.body);

//     if (response.statusCode == 201) {
//       Fluttertoast.showToast(
//           msg: data['message'],
//           backgroundColor: white6,
//           textColor: Colors.black);
//       nameController.clear();
//       emailController.clear();
//       passController.clear();
//       setState(() {
//         _isLoading = false;
//         toLoginPage();
//       });
//     } else if (response.statusCode == 400) {
//       if (name.toString().isEmpty ||
//           password.toString().isEmpty ||
//           email.toString().isEmpty) {
//         Fluttertoast.showToast(
//           msg: 'All fields are required',
//           backgroundColor: white6,
//           textColor: Colors.black,
//         );
//       } else {
//         Fluttertoast.showToast(
//           msg: data['email'],
//           backgroundColor: white6,
//           textColor: Colors.black,
//         );
//       }
//       print(response.body);
//       print(response.statusCode);
//       emailController.clear();
//       passController.clear();
//       setState(() {
//         _isLoading = false;
//       });
//     } else {
//       Fluttertoast.showToast(
//           msg: "Please check your Internet Connection",
//           backgroundColor: white6,
//           textColor: Colors.black);
//       setState(() {
//         _isLoading = false;
//       });
//     }
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

//   void toLoginPage() {
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => const Login()));
//   }
// }
