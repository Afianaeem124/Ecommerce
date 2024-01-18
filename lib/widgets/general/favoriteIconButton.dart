import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FavoriteIconButton extends StatefulWidget {
  final Product favorite;
  Function? state;
  bool isFavorite;

  FavoriteIconButton(
      {required this.favorite, this.state, required this.isFavorite});

  @override
  State<FavoriteIconButton> createState() => _FavoriteIconButtonState();
}

class _FavoriteIconButtonState extends State<FavoriteIconButton> {
  @override
  Widget build(BuildContext context) {
    // bool isFavorite = widget.isFavorite;
    return InkWell(
      onTap: () {
        setState(() {
          widget.isFavorite = !widget.isFavorite;
          if (widget.state != null) {
            widget.state!();
          }

          if (widget.isFavorite == true) {
            if (favoriteList
                .any((element) => element.id == widget.favorite.id)) {
              Fluttertoast.showToast(
                msg: 'Item already exist',
                backgroundColor: white6,
                textColor: Colors.black,
              );
            } else {
              favoriteList.add(widget.favorite);

              Fluttertoast.showToast(
                msg: 'Item added to favorite',
                backgroundColor: white6,
                textColor: Colors.black,
              );
            }
          } else {
            favoriteList.remove(widget.favorite);
            Fluttertoast.showToast(
              msg: 'Item removed from favorite',
              backgroundColor: white6,
              textColor: Colors.black,
            );
          }
        });
      },
      child: Container(
        height: 36,
        width: 36,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(200),
            color: greyLightTextField),
        child: Icon(
          widget.isFavorite == true
              ? Icons.favorite
              : Icons.favorite_border_rounded,
          size: 18,
          color: widget.isFavorite == true ? redIconwithButton : whiteFavorite,
        ),
      ),
    );
  }
}
