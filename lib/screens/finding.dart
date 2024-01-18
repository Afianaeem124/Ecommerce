import 'dart:io';

import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/widgets/general/bottombar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FindingImage extends StatefulWidget {
  final File visualImage;
  FindingImage({required this.visualImage});

  @override
  State<FindingImage> createState() => _FindingImageState();
}

class _FindingImageState extends State<FindingImage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 6), toHomePage);
    super.initState();
  }

  void toHomePage() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Bottombardown(),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 60.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  height: 300,
                  margin: const EdgeInsets.only(bottom: 30
                  ),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: FileImage(widget.visualImage))),
                ),
                Icon(
                  Icons.search_outlined,
                  color: redIconwithButton,
                  size: 62,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 16),
                  child: Text(
                    "Finding similar results...",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: white5),
                    textAlign: TextAlign.center,
                  ),
                ),
                CupertinoActivityIndicator(
                  color: redIconwithButton,
                  radius: 25,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
