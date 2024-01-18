import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/screens/checkout.dart';
import 'package:ecommerce_app/screens/success.dart';
import 'package:ecommerce_app/widgets/bagbar.dart';
import 'package:ecommerce_app/widgets/general/appbar.dart';
import 'package:ecommerce_app/widgets/general/buttons.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class BagPage extends StatefulWidget {
  const BagPage({Key? key}) : super(key: key);

  @override
  State<BagPage> createState() => _BagPageState();
}

class _BagPageState extends State<BagPage> {
  void state() => setState(() {});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(bgColor: Colors.transparent)
          .appbarforBottomItems(context, ""),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, bottom: 12, right: 12),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "My Bag",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              // Container

              Expanded(
                child: Container(
                  width: double.infinity,
                  // margin: const EdgeInsets.only(left: 12, right: 12),
                  child: bagList.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset("animation/ecommerce_Bag.json",
                                width: double.infinity),
                            Text("No Items in you Bag",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(fontSize: 20)),
                          ],
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: ((context, index) {
                            final item = bagList[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 26.0),
                              child: BagBar(
                                state: state,
                                productItem: item,
                                callback: () {
                                  // item.quantity = 1;
                                  // gotoProductCard(item);
                                },
                              ),
                            );
                          }),
                          itemCount: bagList.length,
                        ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Total amount : "),
                  Text("$totalamount\$")
                ],
              ),
              CustomButton(
                callback: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CheckOut()));
                },
                btnName: "CHECKOUT",
                leftMargin: 16,
                rightMargin: 16,
                topMargin: 8,
                bottomMargin: 8,
              ),
            ]),
      ),
    );
  }
}
