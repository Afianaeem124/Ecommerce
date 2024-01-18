import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/screens/specificcategory.dart';
import 'package:ecommerce_app/widgets/general/appbar.dart';
import 'package:ecommerce_app/widgets/general/buttons.dart';
import 'package:ecommerce_app/widgets/category/categoryAll.dart';
import 'package:flutter/material.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void gotoSpecificCategory(String categoryId) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SpecificCategory(
                  categoryID: categoryId,
                  categoryItems: categoryItems,
                )));
  }

  @override
  void initState() {
    // getCategoryData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(bgColor: Colors.transparent)
          .appbarforBottomItems(context, "Category"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomButton(
              btnName: "VIEW ALL ITEMS",
              leftMargin: 16,
              rightMargin: 16,
              topMargin: 8,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Choose Category",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: greyLabelText),
                  ),
                  Text(
                    "${categoryItems!.categories!.length}",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall!
                        .copyWith(color: greyLabelText),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SizedBox(
                height: 600,
                width: double.infinity,
                child: ListView.separated(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: ((context, index) {
                    final item = categoryItems!.categories![index];
                    return Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: categoryBar(
                          categoryName: item.name!,
                          callback: () {
                            gotoSpecificCategory(item.id!);
                          },
                        ));
                  }),
                  separatorBuilder: (context, index) {
                    return Divider(
                      thickness: 0.3,
                      color: greyLabelText.withOpacity(0.4),
                    );
                  },
                  itemCount: categoryItems!.categories!.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
