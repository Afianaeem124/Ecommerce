import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/controller/ecommerceController.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:flutter/material.dart';

class AddtocartIconButton extends StatefulWidget {
  final Product cart;
  const AddtocartIconButton({
    Key? key,
    required this.cart,
  }) : super(key: key);

  @override
  State<AddtocartIconButton> createState() => _AddtocartIconButtonState();
}

class _AddtocartIconButtonState extends State<AddtocartIconButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        EcommerceController().addToCart(widget.cart);
      },
      child: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200), color: redIconwithButton),
        child: Icon(
          Icons.shopping_bag_rounded,
          size: 21,
          color: whiteFavorite,
        ),
      ),
    );
  }
}
