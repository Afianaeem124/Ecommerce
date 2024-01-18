// import 'dart:io';

// import 'package:ecommerce_app/constants/colors.dart';
// import 'package:ecommerce_app/screens/finding.dart';
// import 'package:ecommerce_app/widgets/general/appbar.dart';
// import 'package:ecommerce_app/widgets/general/buttons.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// class VisualSearch extends StatefulWidget {
//   const VisualSearch({Key? key}) : super(key: key);

//   @override
//   State<VisualSearch> createState() => _VisualSearchState();
// }

// class _VisualSearchState extends State<VisualSearch> {
//   File? visualImage;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Scaffold(
//       appBar: MyAppbar(bgColor: Colors.transparent)
//           .appbarwithback(context, "Visual Search", false),
//       body: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 80),
//         decoration: const BoxDecoration(
//             image: DecorationImage(
//                 image: AssetImage("assets/boyImage.png"), fit: BoxFit.fill)),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             Text(
//               "Search for an outfit by taking a photo or uploading an image",
//               style: Theme.of(context)
//                   .textTheme
//                   .displayLarge!
//                   .copyWith(fontSize: 24),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 30, bottom: 15),
//               child: CustomButton(
//                 btnName: "TAKE A PHOTO",
//                 callback: () async {
//                   final ImagePicker picker = ImagePicker();
//                   XFile? image =
//                       await picker.pickImage(source: ImageSource.camera);
//                   setState(() {
//                     visualImage = File(image!.path);
//                   });
//                    toFindingPage(visualImage!);
//                 },
//               ),
//             ),
//             CustomButton(
//               btnName: "UPLOAD AN IMAGE",
//               borderColor: white6,
//               borderRadius: 1.5,
//               fontColor: white6,
//               buttonBackgroundColor: Colors.transparent,
//               callback: () async {
//                 final ImagePicker picker = ImagePicker();
//                 XFile? image =
//                     await picker.pickImage(source: ImageSource.gallery);
//                 setState(() {
//                   visualImage = File(image!.path);
//                 });
//                 toFindingPage(visualImage!);
//               },
//             )
//           ],
//         ),
//       ),
//     ));
//   }

//   void toFindingPage(File takenImage) {
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) =>  FindingImage(visualImage: takenImage,)));
//   }
// }
