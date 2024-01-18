import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/widgets/general/addtocartbutton.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class FavoriteBar extends StatefulWidget {
  Product? productItem;
  final VoidCallback callback;
  final Function state;
  FavoriteBar(
      {required this.productItem, required this.callback, required this.state});

  @override
  State<FavoriteBar> createState() => _FavoriteBarState();
}

class _FavoriteBarState extends State<FavoriteBar> {
  @override
  Widget build(BuildContext context) {
    double screen = MediaQuery.of(context).size.height;
    double screeHeight = MediaQuery.of(context).size.width;
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 7),
                      Row(children: [
                        Expanded(
                          child: Text(widget.productItem!.category!.name!,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(fontSize: 11)),
                        ),
                        const SizedBox(width: 2),
                        Container(
                            alignment: Alignment.topRight,
                            margin: const EdgeInsets.only(right: 7),
                            child: InkWell(
                                onTap: () {
                                  favoriteList.remove(widget.productItem);
                                  widget.state();
                                },
                                child: const Icon(Icons.close_sharp, size: 18)))
                      ]),
                      Text(
                        widget.productItem!.name!,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "${double.parse(widget.productItem!.price!).toStringAsFixed(0)}\$",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontSize: 14)),
                          RatingBar.builder(
                            ignoreGestures: true,
                            initialRating:
                                double.parse(widget.productItem!.rating!),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 18,
                            itemBuilder: (context, _) => const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            onRatingUpdate: (rating) {
                              print(rating);
                            },
                          ),
                          const SizedBox(
                            width: 12,
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Transform.translate(
                offset: Offset(screen * 0.41, screeHeight * 0.31),
                child: AddtocartIconButton(
                  cart: widget.productItem!,
                ))
          ],
        ));
  }
}
