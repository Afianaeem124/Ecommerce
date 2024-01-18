import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/widgets/category/categoryGrid.dart';
import 'package:ecommerce_app/widgets/favoritebar.dart';
import 'package:ecommerce_app/widgets/general/appbar.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  void state() => setState(() {});
  @override
  Widget build(BuildContext context) {
    double screeHeight = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MyAppbar(bgColor: Colors.transparent)
          .appbarforBottomItems(context, ""),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, bottom: 12),
              child: Text(
                "Favorites",
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
                          callback: () {}));
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
                // margin: const EdgeInsets.only(left: 12, right: 12),
                child: favoriteList.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // Icon(
                          //   Icons.bookmarks_outlined,
                          //   size: 100,
                          //   color: redIconwithButton,
                          // ),

                          Lottie.asset("animation/ecommerce_Favorites.json"),
                          Text("No Favorties !!",
                              style: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .copyWith(fontSize: 20)),
                          Text(
                            "You can add an item to your\nfavorites by clicking \"Heart Icon\" ",
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(color: white5.withOpacity(0.8)),
                            textAlign: TextAlign.center,
                          ),
                          const Spacer()
                        ],
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: ((context, index) {
                          final item = favoriteList[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 26.0),
                            child: FavoriteBar(
                              state: state,
                              productItem: item,
                              callback: () {
                                // gotoProductCard(item);
                              },
                            ),
                          );
                        }),
                        itemCount: favoriteList.length,
                      ),
              ),
            )
          ]),
    );
  }
}
