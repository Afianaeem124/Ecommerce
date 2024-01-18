import 'dart:convert';

import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/widgets/general/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;

class ReviewBottom extends StatefulWidget {
  final String productID;
  VoidCallback state;
  ReviewBottom({required this.productID, required this.state});

  @override
  State<ReviewBottom> createState() => _ReviewBottomState();
}

class _ReviewBottomState extends State<ReviewBottom> {
  double? productrating;
  TextEditingController reviewController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(
            16, 14, 16, MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
                width: 60,
                height: 6,
                decoration: BoxDecoration(
                  color: greyLabelText,
                  borderRadius: BorderRadius.circular(3),
                )),
            Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 18),
                child: Text(
                  "What is your rate?",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
                )),
            RatingBar.builder(
              unratedColor: greyLabelText,
              initialRating: 0,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemPadding: EdgeInsets.only(left: 15),
              itemSize: 36,
              itemBuilder: (context, _) => const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                setState(() {
                  productrating = rating;
                });
              },
            ),
            SizedBox(
              height: 26,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 26, 20, 16),
              child: Text("Please share your opinion about the product",
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: greyLightTextField,
                ),
                child: TextField(
                  controller: reviewController,
                  style: Theme.of(context)
                      .textTheme
                      .labelSmall!
                      .copyWith(fontSize: 16),
                  minLines: 4,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: "Your review",
                      hintStyle: Theme.of(context).textTheme.bodySmall),
                )),
            CustomButton(
              btnName: "SEND REVIEW",
              topMargin: 30,
              alignment: Alignment.bottomCenter,
              bottomMargin: 30,
              callback: () {
                setState(() {
                  if (productrating != null) {
                    setState(() {
                      addReview(widget.productID, userId,
                          productrating!.toString(), reviewController.text);
                    });
                  }
                });
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }

  void addReview(
      String productId, String userId, String rating, String review) async {
    http.Response response = await http.post(
        Uri.parse("https://ecommerce.salmanbediya.com/products/review/add"),
        body: {
          'user': userId,
          'product': productId,
          'rating': rating,
          'review': review
        });
    var data = jsonDecode(response.body);
    print(data);
    widget.state();
  }
}
