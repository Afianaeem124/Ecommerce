import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/widgets/general/appbar.dart';

import 'package:ecommerce_app/widgets/profilewidgets/orderdetailsbar.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
  const OrderDetails({super.key});

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: MyAppbar().appbarwithback(context, "Order Details", false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 31, bottom: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Order №1947034",
                        style: Theme.of(context).textTheme.bodyMedium),
                    Text("05-12-2019",
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text("Tracking number:",
                          style: Theme.of(context).textTheme.bodySmall),
                      const SizedBox(width: 8),
                      Text(
                        "IW3475453455",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                  Text("Delivered",
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: greenprofile, fontWeight: FontWeight.w500)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 18),
                child: Text(
                  "3 items",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: white6, fontWeight: FontWeight.w500),
                ),
              ),
              OrderDetailsBar(imagPath: "assets/h6.jpeg"),
              OrderDetailsBar(imagPath: "assets/h6.jpeg"),
              OrderDetailsBar(imagPath: "assets/h6.jpeg"),
              OrderDetailsBar(imagPath: "assets/h6.jpeg"),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 15),
                child: Text(
                  "Order information",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
              _orderInfo("Shipping Address:",
                  "3 Newbridge Court ,Chino Hills,\nCA 91709, United States"),
              _orderInfo("Payment method:", "**** **** **** 3947"),
              _orderInfo("Delivery method:", "FedEx, 3 days, 15\$"),
              _orderInfo("Discount:", "10%, Personal promo code"),
              _orderInfo("Total Amount:", "133\$"),

              // Padding(
              //   padding: const EdgeInsets.only(top: 10, bottom: 37),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       CustomButton(
              //           topMargin: 14,
              //           width: 160,
              //           height: 36,
              //           btnName: "Reorder",
              //           borderColor: white6,
              //           borderRadius: 1.5,
              //           fontColor: white6,
              //           buttonBackgroundColor: Colors.transparent,
              //           callback: () {}),
              //       CustomButton(
              //         btnName: "Leave feedback",
              //         width: 160,
              //         height: 36,
              //       )

              //       // CustomButton(
              //       //   text: "Reorder",
              //       //   callback: () {},
              //       //   fontcolor: white6,
              //       //   btnwidth: 160,
              //       //   btnheight: 36,
              //       //   btncolor: transparent,
              //       //   bordercolor: white6,
              //       // ),
              //       // CustomButton(
              //       //     text: "Leave feedback",
              //       //     callback: () {},
              //       //     btnwidth: 160,
              //       //     btnheight: 36)
              //     ],
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget _orderDetails(String imgPath) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 104,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: greyLightTextField),
          child: Row(
            children: [
              Container(
                width: 107,
                height: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.horizontal(
                      left: Radius.circular(8),
                    ),
                    image: DecorationImage(
                        image: AssetImage(imgPath), fit: BoxFit.fill)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 11, right: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 11, bottom: 4),
                      child: Text(
                        "Pullover",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    Text("Mango",
                        style: Theme.of(context).textTheme.displaySmall),
                    Padding(
                      padding: const EdgeInsets.only(top: 9, bottom: 13),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _showkeyText("Color: "),
                            _showvalueText("Gray"),
                            const SizedBox(width: 16),
                            _showkeyText("Size: "),
                            _showvalueText("L")
                          ]),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(children: [
                          _showkeyText("Units: "),
                          _showvalueText("1")
                        ]),
                        const SizedBox(width: 153),
                        Text("51\$",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: 14, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        )
      ],
    );
  }

  Widget _orderInfo(String textkey, String textValue) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(textkey,
                style: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontSize: 14)),
            const SizedBox(width: 10),
            Text(textValue,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontSize: 14, fontWeight: FontWeight.w500)),
          ],
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _showkeyText(String keyText) {
    return Text(
      keyText,
      style: Theme.of(context).textTheme.displaySmall,
    );
  }

  Widget _showvalueText(String valueText) {
    return Text(valueText,
        style:
            Theme.of(context).textTheme.displaySmall!.copyWith(color: white6));
  }
}
