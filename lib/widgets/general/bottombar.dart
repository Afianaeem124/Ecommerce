import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/model/categorylist.dart';
import 'package:ecommerce_app/screens/BottomBarScreens/bag.dart';
import 'package:ecommerce_app/screens/BottomBarScreens/favorites.dart';
import 'package:ecommerce_app/screens/BottomBarScreens/homepage.dart';
import 'package:ecommerce_app/screens/BottomBarScreens/profile.dart';
import 'package:ecommerce_app/screens/BottomBarScreens/shop.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Bottombardown extends StatefulWidget {
  Bottombardown({Key? key}) : super(key: key);

  @override
  State<Bottombardown> createState() => _BottombardownState();
}

class _BottombardownState extends State<Bottombardown> {
  Future<void> getCategoryData() async {
    http.Response categoryresponse = await http.get(Uri.parse(
        "https://ecommerce.salmanbediya.com/products/category/getAll"));
    setState(() {
      categoryItems = categorylistFromMap(categoryresponse.body);
      for (var items in categoryItems!.categories!) {
        categoryList.add(items);
      }
    });
  }

  @override
  void initState() {
    getCategoryData();
    super.initState();
  }

  int _selectedItem = 0;
  final _pages = [
    const HomePage(),
    const ShopPage(),
    const BagPage(),
    const FavoritesPage(),
    const ProfilePage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home_sharp), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_cart_rounded), label: "Shop"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shopping_bag_rounded), label: "Bag"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite_sharp,
                  ),
                  label: "Favorites"),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person_outline_rounded,
                  ),
                  label: "Profile"),
            ],
            currentIndex: _selectedItem,
            onTap: (setvalue) {
              setState(() {
                _selectedItem = setvalue;
              });
            }),
      ),
      body: _pages[_selectedItem],
    );
  }
}
