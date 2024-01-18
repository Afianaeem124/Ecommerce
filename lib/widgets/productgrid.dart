import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/widgets/general/favoriteIconButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../constants/colors.dart';

class ProductGrid extends StatefulWidget {
  final Product product;
  final VoidCallback callback;
  bool isFavorite;

  ProductGrid(
      {required this.product,
      required this.callback,
      required this.isFavorite});

  @override
  State<ProductGrid> createState() => _ProductGridState();
}

class _ProductGridState extends State<ProductGrid> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.all(8),
      width: screenHeight * 0.22,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                InkWell(
                  onTap: widget.callback,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage("${widget.product.image}"))),
                  ),
                ),
                Positioned(
                  child: Transform.translate(
                    offset: const Offset(0, 20),
                    child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(200),
                          color: greyLightTextField),
                      child: Icon(
                        widget.isFavorite == true
                            ? Icons.favorite
                            : Icons.favorite_border_rounded,
                        size: 18,
                        color: widget.isFavorite == true
                            ? redIconwithButton
                            : whiteFavorite,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 7.0, horizontal: 6),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RatingBar.builder(
                  ignoreGestures: true,
                  initialRating: double.parse(widget.product.rating!),
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
                   
                  },
                ),
                Text(
                  widget.product.description!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(fontSize: 11),
                ),
                Text(
                  widget.product.name!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                Text(
                  widget.product.price!,
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .copyWith(color: redIconwithButton),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
