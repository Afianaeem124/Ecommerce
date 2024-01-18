// import 'package:ecommerce_app/constants/colors.dart';
// import 'package:ecommerce_app/widgets/general/appbar.dart';
// import 'package:ecommerce_app/widgets/general/buttons.dart';
// import 'package:flutter/material.dart';

// class ForgotPassword extends StatefulWidget {
//   const ForgotPassword({Key? key}) : super(key: key);

//   @override
//   State<ForgotPassword> createState() => _ForgotPasswordState();
// }

// class _ForgotPasswordState extends State<ForgotPassword> {
//   TextEditingController emailController = TextEditingController();

//   bool isObscure = false;

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
//                     "Forgot Password",
//                     style: Theme.of(context).textTheme.displayLarge,
//                   ),
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(
//                       top: 80, left: 24, right: 25, bottom: 38),
//                   child: Column(
//                     children: [
//                       Text(
//                         "Please, enter your email address. You will receive a link to create a new password via email.",
//                         style: Theme.of(context)
//                             .textTheme
//                             .bodySmall!
//                             .copyWith(color: white6),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(top: 16, bottom: 55),
//                         child: showTextField("Email Address", false,
//                             TextInputAction.next, emailController),
//                       ),
//                       CustomButton(
//                         btnName: "SEND",
//                         callback: () {},
//                       ),
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
//         label: Text(textHint),
//       ),
//     );
//   }

//   void toHomePage(BuildContext context) {
//     // Navigator.push(
//     //     context, MaterialPageRoute(builder: (context) => const HomePage()));
//     // Navigator.pushReplacement(
//     //     context, MaterialPageRoute(builder: ((context) => const HomePage())));
//     // Navigator.pushAndRemoveUntil(
//     //   context,
//     //   MaterialPageRoute(builder: (BuildContext context) => Bottombar()),
//     //   ModalRoute.withName(' '),
//     // );
//   }
//   void toForgotPassword() {
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => ForgotPassword()));
//   }
// }
