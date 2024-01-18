import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/screens/myorders.dart';
import 'package:ecommerce_app/screens/settings.dart';
import 'package:ecommerce_app/widgets/general/appbar.dart';
import 'package:ecommerce_app/widgets/profilewidgets/profiletile.dart';

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppbar(bgColor: Colors.transparent)
            .appbarforBottomItems(context, ""),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 18, left: 14),
              child: Text(
                "My profile",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      EdgeInsets.only(left: 17, top: 24, right: 18, bottom: 28),
                  child: CircleAvatar(
                    backgroundColor: greyLightTextField,
                    radius: 32,
                    child: Icon(
                      Icons.person,
                      color: greyLabelText,
                      size: 50,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userName,
                        style: Theme.of(context).textTheme.displayMedium),
                    Text(useremail,
                        style: Theme.of(context).textTheme.bodySmall)
                  ],
                ),
              ],
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  ProfileTile(
                    title: "My orders",
                    subtitle: "Already have 12 orders",
                    callback: () {
                      _toMyOrdersPage(context);
                    },
                  ),
                  const ProfileTile(
                    title: "Shipping addresses",
                    subtitle: "3 addresses",
                  ),
                  const ProfileTile(
                    title: "Payment methods",
                    subtitle: "Visa  **34",
                  ),
                  const ProfileTile(
                    title: "Promocodes",
                    subtitle: "You have special promocodes",
                  ),
                  const ProfileTile(
                    title: "My reviews",
                    subtitle: "Reviews for 4 items",
                  ),
                  ProfileTile(
                    title: "Settings",
                    subtitle: "Notifications, password",
                    callback: () => _toSettingsPage(context),
                  ),
                ],
              ),
            )
          ]),
        ));
  }

  void _toMyOrdersPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const MyOrders()));
  }

  void _toSettingsPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Settings()));
  }
}
