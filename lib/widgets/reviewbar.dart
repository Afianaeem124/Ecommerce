import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/model/reviews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Reviewbar extends StatelessWidget {
  Review product;

  Reviewbar({required this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: greyLightTextField,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 24.0, right: 10, top: 20, bottom: 33),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.user!.name!,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RatingBar.builder(
                    ignoreGestures: true,
                    initialRating: double.parse(product.rating!),
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 18,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                  Text(
                    product.dateCreated.toString().substring(0, 10),
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(fontSize: 11, color: greyLabelText),
                  )
                ],
              ),
              const SizedBox(height: 10),
              Text(product.review!,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .copyWith(color: white5)),
            ],
          ),
        ));
  }
}
