import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/model/categorylist.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/model/reviews.dart';
import 'package:ecommerce_app/screens/productCard.dart';
import 'package:ecommerce_app/screens/BottomBarScreens/shop.dart';
import 'package:ecommerce_app/widgets/category/categoryGrid.dart';
import 'package:ecommerce_app/widgets/category/productbar.dart';
import 'package:ecommerce_app/widgets/general/buttons.dart';
import 'package:ecommerce_app/widgets/general/reviewbottomsheet.dart';
import 'package:ecommerce_app/widgets/reviewbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import '../widgets/general/appbar.dart';

class ReviewsandRating extends StatefulWidget {
  final String productID;
  ReviewsandRating({required this.productID});

  @override
  State<ReviewsandRating> createState() => _ReviewsandRatingState();
}

class _ReviewsandRatingState extends State<ReviewsandRating> {
  Reviews? productReview;
  double? averagerating;

  Future<void> getratingData(String id) async {
    http.Response reviewResponse = await http.get(Uri.parse(
        "https://ecommerce.salmanbediya.com/products/review/get/$id"));
    setState(() {
      productReview = reviewsFromJson(reviewResponse.body);
      if (productReview != null) {
        double sum = 0;
        for (var item in productReview!.reviews!) {
          sum = sum + double.parse(item.rating!);
        }
        if (productReview!.reviews!.length != 0) {
          averagerating = sum / productReview!.reviews!.length;
        } else {
          averagerating = 0;
        }
      }
    });
  }

  @override
  void initState() {
    getratingData(widget.productID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void state() => setState(() {
          getratingData(widget.productID);
        });
    double screeHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MyAppbar(bgColor: Colors.transparent)
          .appbarwithback(context, "", false),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await {
            _showBottomSheet(context, state),
          };
        },
        shape: StadiumBorder(),
        backgroundColor: redIconwithButton,
        elevation: 2,
        label: Text(
          "Write a review",
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: whiteFavorite),
        ),
        icon: Icon(
          Icons.edit_sharp,
          size: 20,
          color: whiteonly,
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rating&Reviews",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 50),
              Text(
                averagerating != null
                    ? averagerating!.toStringAsFixed(1)
                    : "---",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 6),
              Text(
                averagerating != null
                    ? "${productReview!.reviews!.length} ratings"
                    : "",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: ((context, index) {
                    Review? item;
                    if (productReview != null) {
                      item = productReview!.reviews![index];
                    }
                    return Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: productReview == null
                            ? Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  color: greyLightTextField,
                                ),
                              )
                            : Reviewbar(
                                product: item!,
                              ));
                  }),
                  itemCount: productReview == null
                      ? 3
                      : productReview!.reviews!.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, VoidCallback state) {
    showModalBottomSheet(
      elevation: 2,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(34),
      )),
      backgroundColor: greyScaffoldbf,
      isScrollControlled: true,
      builder: (context) {
        return ReviewBottom(
          productID: widget.productID,
          state: () {
            state();
          },
        );
      },
    );
  }
}
