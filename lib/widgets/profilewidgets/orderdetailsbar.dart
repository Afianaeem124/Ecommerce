import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/widgets/general/addtocartbutton.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class OrderDetailsBar extends StatefulWidget {
  final String imagPath;
  OrderDetailsBar({required this.imagPath});

  @override
  State<OrderDetailsBar> createState() => _OrderDetailsBarState();
}

class _OrderDetailsBarState extends State<OrderDetailsBar> {
  @override
  Widget build(BuildContext context) {
    double screeHeight = MediaQuery.of(context).size.width;
    return Card(
        color: greyLightTextField,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: screeHeight * 0.32,
                  height: screeHeight * 0.38,
                  margin: const EdgeInsets.only(right: 11),
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(4),
                          bottomLeft: Radius.circular(4)),
                      image: DecorationImage(
                          image: AssetImage(widget.imagPath),
                          fit: BoxFit.fill)),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, right: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Pullover",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(width: 2),
                        Text("Mango",
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 11)),
                        const SizedBox(height: 15),
                        RichText(
                          text: TextSpan(
                              text: "Color:",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 11),
                              children: [
                                TextSpan(
                                    text: "\tGray",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(fontSize: 11)),
                                TextSpan(
                                    text: "\t\t\t\t\t\t\t\t\t\tSize:",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(fontSize: 11)),
                                TextSpan(
                                    text: "\tL",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(fontSize: 11))
                              ]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: "Units:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(fontSize: 11),
                                  children: [
                                    TextSpan(
                                        text: "\t1",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(fontSize: 11)),
                                  ]),
                            ),
                            Text(
                              "51\$",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: 14),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ));
  }
}
