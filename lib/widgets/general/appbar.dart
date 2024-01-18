import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter/material.dart';

class MyAppbar {
  final Color? bgColor;
  MyAppbar({this.bgColor});
  appbarwithback(BuildContext context, String title, bool isHomepage) {
    return AppBar(
      backgroundColor: bgColor ?? Theme.of(context).appBarTheme.backgroundColor,
      automaticallyImplyLeading: false,
      leading: isHomepage == true
          ? IconButton(
              color: white6,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                // Drawer open hone ka function lgana ha
              },
              icon: const Icon(
                Icons.menu_rounded,
              ),
            )
          : IconButton(
              color: white6,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
              ),
            ),
      actions: [
        if (isHomepage == true) ...[
          IconButton(
            color: white6,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.notifications_rounded),
          ),
        ]
      ],
      title: Row(
        children: [
          if (title.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(title),
            ),
          ]
        ],
      ),
    );
  }

  appbarforSignUp(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor ?? Theme.of(context).appBarTheme.backgroundColor,
      automaticallyImplyLeading: false,
    );
  }

  appbarforBottomItems(BuildContext context, String title) {
    return AppBar(
      backgroundColor: bgColor ?? Theme.of(context).appBarTheme.backgroundColor,
      automaticallyImplyLeading: false,
      title: title.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Center(child: Text(title)),
            )
          : null,
      actions: [
        IconButton(
          color: white6,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          onPressed: () {},
          icon: const Icon(Icons.search_sharp),
        ),
      ],
    );
  }
}
