import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter/material.dart';

class CategoryGrid extends StatelessWidget {
  double screeHeight;
  String gridName;
  final VoidCallback callback;
  CategoryGrid(
      {required this.screeHeight,
      required this.gridName,
      required this.callback});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        // height: screeHeight * 0.09,
        // width: screeHeight * 0.30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(29),
          color: white6,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Center(
              child: Text("$gridName",
                  style: Theme.of(context).textTheme.labelMedium)),
        ),
      ),
    );
  }
}
