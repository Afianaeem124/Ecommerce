import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/screens/orderdetails.dart';
import 'package:ecommerce_app/widgets/general/appbar.dart';
import 'package:ecommerce_app/widgets/general/buttons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyOrders extends StatefulWidget {
  const MyOrders({super.key});

  @override
  State<MyOrders> createState() => _MyOrdersState();
}

class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar().appbarwithback(context, "", false),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.only(top: 18, left: 14, bottom: 24),
          child: Text("My Orders",
              style: GoogleFonts.metrophobic(
                  color: white6, fontSize: 34, fontWeight: FontWeight.w700)),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _showTab(
                  nametext: "Delivered",
                  color: white6,
                  textStyle:
                      GoogleFonts.metrophobic(color: greyLightTextField)),
              _showTab(
                  nametext: "Processing",
                  textStyle: GoogleFonts.metrophobic(color: white6)),
              _showTab(
                nametext: "Cancelled",
                textStyle: GoogleFonts.metrophobic(color: white6),
              )
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                _orderCards(),
                _orderCards(),
                _orderCards(),
                _orderCards(),
              ],
            ),
          ),
        )
      ]),
    );
  }

  Widget _showTab(
      {required String nametext,
      Color color = Colors.transparent,
      required TextStyle textStyle}) {
    return InkWell(
      child: Container(
        width: 100,
        height: 30,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(29)),
        child: Center(child: Text(nametext, style: textStyle)),
      ),
    );
  }

  Widget _orderCards() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: greyLightTextField),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Order №1947034",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Text(
                  "05-12-2019",
                  style: Theme.of(context).textTheme.bodySmall,
                )
              ],
            ),
            RichText(
                text: TextSpan(
                    text: "Tracking number:",
                    style: Theme.of(context).textTheme.bodySmall,
                    children: [
                  TextSpan(
                      text: "\t\t\t\tIW3475453455",
                      style: Theme.of(context).textTheme.labelSmall)
                ])),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                    text: TextSpan(
                        text: "Quantity:",
                        style: Theme.of(context).textTheme.bodySmall,
                        children: [
                      TextSpan(
                          text: "\t\t\t\t3",
                          style: Theme.of(context).textTheme.labelSmall)
                    ])),
                RichText(
                    text: TextSpan(
                        text: "Total Amount:",
                        style: Theme.of(context).textTheme.bodySmall,
                        children: [
                      TextSpan(
                          text: "\t\t\t\t112\$",
                          style: Theme.of(context).textTheme.labelSmall)
                    ])),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomButton(
                    topMargin: 14,
                    width: 98,
                    height: 36,
                    btnName: "Details",
                    borderColor: white6,
                    borderRadius: 1.5,
                    fontColor: white6,
                    buttonBackgroundColor: Colors.transparent,
                    callback: () {
                      _toOrderDetailsPage(context);
                    }),
                Text(
                  "Delivered",
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: greenprofile),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _toOrderDetailsPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const OrderDetails()));
  }
}
