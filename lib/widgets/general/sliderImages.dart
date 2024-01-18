import 'dart:async';

import 'package:ecommerce_app/widgets/general/buttons.dart';
import 'package:flutter/material.dart';

class SliderImagesHome extends StatefulWidget {
  final VoidCallback callback;
  final bool isCheck;

  SliderImagesHome({required this.callback, required this.isCheck});

  @override
  State<SliderImagesHome> createState() => _SliderImagesHomeState();
}

class _SliderImagesHomeState extends State<SliderImagesHome> {
  PageController Pcontroller = PageController(initialPage: 0);
  List slidingImage = [
    "assets/h1.jpeg",
    "assets/h2.jpeg",
    "assets/h3.jpeg",
    "assets/h4.jpeg",
    "assets/h5.jpeg",
    "assets/h6.jpeg"
  ];
  int currentIndex = 0;

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (currentIndex < slidingImage.length) {
        currentIndex++;
        Pcontroller.animateToPage(currentIndex,
            duration: const Duration(milliseconds: 350), curve: Curves.easeIn);
      } else {
        currentIndex = 0;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenHegih = MediaQuery.of(context).size.height;
    return PageView.builder(
      controller: Pcontroller,
      itemBuilder: (context, index) {
        return Container(
          height: screenHegih,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image:
                      AssetImage(slidingImage[index % slidingImage.length]))),
          child: Padding(
            padding: const EdgeInsets.only(left: 15, bottom: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.isCheck == true ? "Street Clothes" : "Fashion\nsale",
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontSize: screenHegih * 0.055),
                ),
                if (widget.isCheck == false) ...[
                  CustomButton(
                    topMargin: 20,
                    btnName: "Check",
                    width: 160,
                    height: screenHegih * 0.045,
                    callback: widget.callback,
                  )
                ]
              ],
            ),
          ),
        );
      },
    );
  }
}
