import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/controller/ecommerceController.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/screens/reviews.dart';
import 'package:ecommerce_app/widgets/general/appbar.dart';
import 'package:ecommerce_app/widgets/general/buttons.dart';
import 'package:ecommerce_app/widgets/general/dropdown.dart';
import 'package:ecommerce_app/widgets/general/favoriteIconButton.dart';
import 'package:ecommerce_app/widgets/productgrid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import '../model/product.dart';

class ProductCard extends StatefulWidget {
  Product? productItem;
  Function? state;

  ProductCard({required this.productItem, this.state});

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  ProductModal? allItems;

  Future<void> getallproductData() async {
    http.Response allesponse = await http
        .get(Uri.parse("https://ecommerce.salmanbediya.com/products/getAll"));
    setState(() {
      allItems = productModalFromJson(allesponse.body);
    });
  }

  @override
  void initState() {
    getallproductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void newstate() => setState(() {});
    double screemHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: MyAppbar(bgColor: greyScaffoldbf).appbarwithback(
            context, "${widget.productItem!.category!.name}", false),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: screemHeight * 0.56,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: NetworkImage(
                          "${widget.productItem!.image}",
                        ))),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 16, top: 12, bottom: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(children: [
                      Expanded(
                          child: SizeDropDown(
                        hintText: "Size",
                      )),
                      const SizedBox(width: 8),
                      Expanded(
                          child: SizeDropDown(
                        hintText: "Color",
                      )),
                      const SizedBox(
                        width: 18,
                      ),
                      FavoriteIconButton(
                        isFavorite: EcommerceController()
                            .isProductFavorite(widget.productItem!),
                        favorite: widget.productItem!,
                        state: () {
                          if (widget.state != null) {
                            widget.state!();
                          }
                        },
                      )
                    ]),
                    const SizedBox(height: 22),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text(
                              "${widget.productItem!.name}",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(fontSize: 26),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text("\$${widget.productItem!.price}",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge!
                                    .copyWith(fontSize: 25)),
                          )
                        ]),
                    Text(
                      "${widget.productItem!.category!.name}",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: greyLabelText, fontSize: 11),
                    ),
                    const SizedBox(height: 10),
                    RatingBar.builder(
                      unratedColor: greyLabelText,
                      initialRating: double.parse(widget.productItem!.rating!),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ReviewsandRating(
                                    productID: widget.productItem!.id!)));
                      },
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "${widget.productItem!.description}",
                      style: Theme.of(context)
                          .textTheme
                          .labelSmall!
                          .copyWith(color: white5, fontWeight: null),
                    ),
                    const SizedBox(height: 10),
                    CustomButton(
                      btnName: "ADD TO CART",
                      topMargin: 8,
                      bottomMargin: 15,
                      callback: () {
                        EcommerceController().addToCart(widget.productItem!);
                      },
                    ),
                  ],
                ),
              ),
              _bottomTiles(),
              if (allItems == null) ...[
                CupertinoActivityIndicator(
                  color: redIconwithButton,
                )
              ] else ...[
                Padding(
                  padding:
                      const EdgeInsets.only(left: 16.0, right: 16, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("You can also like this",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(fontSize: 18)),
                      Text(
                        "${allItems!.products!.length} Items",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 12, color: greyLabelText),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: screemHeight * 0.40,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: ((context, index) {
                      final item = allItems!.products![index];

                      return ProductGrid(
                        isFavorite: favoriteList
                            .any((element) => element.id == item.id),
                        product: item,
                        callback: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductCard(
                                        productItem: item,
                                        state: () {
                                          newstate();
                                        },
                                      )));
                        },
                      );
                    }),
                    itemCount: allItems!.products!.length,
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }

  Widget _bottomTiles() {
    return Column(
      children: [
        Divider(color: greyLabelText, thickness: 0.4),
        ListTile(
          title: Text(
            "Shopping Info",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: white5,
            size: 14,
          ),
        ),
        Divider(color: greyLabelText, thickness: 0.4),
        ListTile(
          title: Text(
            "Support",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            color: white5,
            size: 14,
          ),
        ),
        Divider(color: greyLabelText, thickness: 0.4),
      ],
    );
  }
}
