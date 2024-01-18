import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/screens/productCard.dart';
import 'package:ecommerce_app/widgets/productgrid.dart';
import 'package:ecommerce_app/widgets/general/sliderImages.dart';
import 'package:ecommerce_app/widgets/shimmers/shimmergrid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> getproductData() async {
    if (proItems.products == null) {
      print("Hit inside");
      http.Response newresponse = await http.get(Uri.parse(
          "https://ecommerce.salmanbediya.com/products/tag/new/getAll"));
      setState(() {
        proItems = productModalFromJson(newresponse.body);
      });
    } else {
      print("hit outside");
      print(proItems.products!.length);
      return;
    }
  }

  @override
  void initState() {
    getproductData();
    isCheck = false;
    super.initState();
  }

  @override
  void dispose() {
    print("dispose in homepage");
    super.dispose();
  }

  bool isCheck = false;

  void checkButton() async {
    if (saleItems.products == null) {
      http.Response saleresponse = await http.get(Uri.parse(
          "https://ecommerce.salmanbediya.com/products/tag/sale/getAll"));
      setState(() {
        saleItems = productModalFromJson(saleresponse.body);
      });
    }
    setState(() {
      isCheck = !isCheck;
    });
  }

  @override
  Widget build(BuildContext context) {
    void newstate() => setState(() {});
    double screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              SizedBox(
                  height:
                      isCheck == true ? screenHeight * 0.2 : screenHeight * 0.8,
                  child: SliderImagesHome(
                    isCheck: isCheck,
                    callback: checkButton,
                  )),
              const SizedBox(
                height: 20,
              ),
              if (proItems.products == null) ...[
                CupertinoActivityIndicator(color: redIconwithButton),
                GetShimmerLoading().getShimmerGrid(screenHeight)
              ] else ...[
                Container(
                  margin: const EdgeInsets.only(left: 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (isCheck == true) ...[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "SALE",
                              style: Theme.of(context).textTheme.displayLarge,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  "view all",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ))
                          ],
                        ),
                        Text(
                          "Super summer sale",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(
                          height: screenHeight * 0.40,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: ((context, index) {
                              final item = saleItems.products![index];

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
                            itemCount: saleItems.products!.length,
                          ),
                        ),
                      ],
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "NEW",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                "view all",
                                style: Theme.of(context).textTheme.labelSmall,
                              ))
                        ],
                      ),
                      Text(
                        "You’ve never seen it before!",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      SizedBox(
                        height: screenHeight * 0.40,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: ((context, index) {
                            final item = proItems.products![index];

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
                          itemCount: proItems.products!.length,
                        ),
                      ),
                    ],
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
