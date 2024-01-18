import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/model/categorylist.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:ecommerce_app/screens/productCard.dart';
import 'package:ecommerce_app/screens/BottomBarScreens/shop.dart';
import 'package:ecommerce_app/widgets/category/categoryGrid.dart';
import 'package:ecommerce_app/widgets/category/productbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../widgets/general/appbar.dart';

class SpecificCategory extends StatefulWidget {
  final String categoryID;
  Categorylist? categoryItems;
  SpecificCategory({required this.categoryID, required this.categoryItems});

  @override
  State<SpecificCategory> createState() => _SpecificCategoryState();
}

class _SpecificCategoryState extends State<SpecificCategory> {
  ProductModal? category;

  Future<void> getproductData(String id) async {
    http.Response catresponse = await http.get(Uri.parse(
        "https://ecommerce.salmanbediya.com/products/get/category/$id"));
    setState(() {
      category = productModalFromJson(catresponse.body);
    });
  }

  @override
  void initState() {
    getproductData(widget.categoryID);
    super.initState();
  }

  void categoryChange(String categoryId) {
    setState(() {
      getproductData(categoryId);
    });
  }

  void gotoProductCard(
    Product productItem,
  ) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductCard(
                  productItem: productItem,
                ))).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    double screeHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MyAppbar(bgColor: Colors.transparent)
          .appbarwithback(context, "", false),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (category == null) ...[
              CupertinoActivityIndicator(
                radius: 30,
                color: redIconwithButton,
              )
            ] else ...[
              Padding(
                padding: const EdgeInsets.only(left: 15, bottom: 12),
                child: Text(
                  "${category!.products![0].category!.name}",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              // Container

              SizedBox(
                height: screeHeight * 0.09,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: ((context, index) {
                    final item = categoryList[index];
                    return Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: CategoryGrid(
                            screeHeight: screeHeight,
                            gridName: item.name!,
                            callback: () {
                              setState(() {
                                categoryChange(item.id!);
                              });
                            }));
                  }),
                  itemCount: categoryList.length,
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.import_export_outlined,
                      color: white6,
                      size: 20,
                    ),
                    label: Text(
                      "Price: lowest to high",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 13),
                    )),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(left: 12, right: 12),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: ((context, index) {
                      final item = category!.products![index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 26.0),
                        child: ProductCatBar(
                          productItem: item,
                          callback: () {
                            gotoProductCard(item);
                          },
                        ),
                      );
                    }),
                    itemCount: category!.products!.length,
                  ),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}
