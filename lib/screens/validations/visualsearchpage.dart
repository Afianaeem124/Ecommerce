import 'dart:io';
import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/screens/validations/findings.dart';
import 'package:ecommerce_app/widgets/general/appbar.dart';
import 'package:ecommerce_app/widgets/general/bottombar.dart';
import 'package:ecommerce_app/widgets/general/buttons.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

class VisualSearch extends StatefulWidget {
  const VisualSearch({super.key});

  @override
  State<VisualSearch> createState() => _VisualSearchState();
}

class _VisualSearchState extends State<VisualSearch> {
  File? searchImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(bgColor: Colors.transparent)
          .appbarwithback(context, "Visual Search", false),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        decoration: const BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.mode(
                  Colors.black,
                  BlendMode.dst,
                ),
                image: AssetImage(
                  'assets/boyImage.jpeg',
                ),
                fit: BoxFit.cover)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Search for an outfit by taking a photo or uploading an image',
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontSize: 24),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 15),
              child: CustomButton(
                  btnName: 'TAKE A PHOTO',
                  // text: 'TAKE A PHOTO',
                  callback: () async {
                    final ImagePicker picker = ImagePicker();
                    XFile? image =
                        await picker.pickImage(source: ImageSource.camera);
                    print(image?.name);
                    print(image?.path);
                    if (image != null) {
                      setState(() {
                        searchImage = File(image.path);
                        tovisualsearchfinding(context);
                      });
                    }
                  }),
            ),
            CustomButton(
              btnName: 'UPLOAD AN IMAGE',
              // text: 'UPLOAD AN IMAGE',
              callback: () async {
                final ImagePicker picker = ImagePicker();
                XFile? image =
                    await picker.pickImage(source: ImageSource.gallery);
                if (image != null) {
                  setState(() {
                    searchImage = File(image.path);
                    tovisualsearchfinding(context);
                  });
                }
              },
              buttonBackgroundColor: Colors.transparent,
              // btncolor: Colors.transparent,

              borderColor: white6,
              fontColor: white6,
            ),
            Container(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  toHomepageWithBottomBar(context);
                },
                child: Text(
                  'Skip ->',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: white6, decoration: TextDecoration.underline),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void toHomepageWithBottomBar(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (BuildContext context) => Bottombardown()),
      ModalRoute.withName(''),
    );
  }

  void tovisualsearchfinding(BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) =>
              VisualFinding(searchImage: searchImage)),
      ModalRoute.withName(''),
    );
  }
}
