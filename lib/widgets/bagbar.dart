import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/widgets/general/addtocartbutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BagBar extends StatefulWidget {
  Product? productItem;
  final VoidCallback callback;
  final Function state;
  BagBar(
      {required this.productItem, required this.callback, required this.state});

  @override
  State<BagBar> createState() => _BagBarState();
}

class _BagBarState extends State<BagBar> {
  // int quantity = 1;
  @override
  Widget build(BuildContext context) {
    double productprice = double.parse(widget.productItem!.price!);
    double screeHeight = MediaQuery.of(context).size.width;
    // widget.productItem!.quantity = 1;
    return Card(
        color: greyLightTextField,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: widget.callback,
                  child: Container(
                    width: screeHeight * 0.32,
                    height: screeHeight * 0.38,
                    margin: const EdgeInsets.only(right: 11),
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(4),
                            bottomLeft: Radius.circular(4)),
                        image: DecorationImage(
                            image: NetworkImage(widget.productItem!.image!),
                            fit: BoxFit.fill)),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, right: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productItem!.name!,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            InkWell(
                              // Decrease Icon
                              onTap: () {
                                setState(() {
                                  widget.productItem!.quantity--;
                                  // quantity--;
                                  if (totalamount != 0) {
                                    totalamount = totalamount -
                                        double.parse(
                                            widget.productItem!.price!);
                                    widget.state();
                                  }

                                  if (widget.productItem!.quantity == 0) {
                                    bagList.remove(widget.productItem);
                                    widget.state();
                                  }
                                });
                              },
                              child: Container(
                                height: 36,
                                width: 36,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(200),
                                    color: greyLightTextField),
                                child: Icon(
                                  Icons.remove,
                                  size: 18,
                                  color: whiteFavorite,
                                ),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text("${widget.productItem!.quantity}"),
                            const SizedBox(width: 8),
                            InkWell(
                              // Increase Icon
                              onTap: () {
                                setState(() {
                                  widget.productItem!.quantity++;
                                  totalamount =
                                      double.parse(widget.productItem!.price!) +
                                          totalamount;
                                  widget.state();
                                });
                              },
                              child: Container(
                                height: 36,
                                width: 36,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(200),
                                    color: greyLightTextField),
                                child: Icon(
                                  Icons.add,
                                  size: 18,
                                  color: whiteFavorite,
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            if (widget.productItem!.quantity > 1) ...[
                              Expanded(
                                child: Text(
                                    "${widget.productItem!.quantity * productprice}\$",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(fontSize: 14)),
                              ),
                            ]
                          ],
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: RichText(
                              text: TextSpan(
                                  text: "Product Price:",
                                  style: Theme.of(context).textTheme.bodySmall,
                                  children: [
                                    TextSpan(
                                        text: "\t\t\t$productprice\$",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(fontSize: 14))
                                  ]),
                            )),
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
