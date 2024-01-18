import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/main.dart';
import 'package:ecommerce_app/model/product.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EcommerceController {
  void addToCart(Product productItem) {
    if (bagList.any((element) => element.id == productItem.id)) {
      Fluttertoast.showToast(
          msg: "Quantity Increased",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: greyScaffoldbf.withOpacity(0.8),
          textColor: whiteonly,
          fontSize: 16.0);
      productItem.quantity++;
      totalamount = double.parse(productItem.price!) + totalamount;
    } else {
      productItem.quantity++;
      bagList.add(productItem);
      Fluttertoast.showToast(
          msg: "Item added in cart",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: greyScaffoldbf.withOpacity(0.8),
          textColor: whiteonly,
          fontSize: 16.0);
      totalamount = double.parse(productItem.price!) + totalamount;
    }
  }

  bool isProductFavorite(Product productItem) {
    return favoriteList.any((element) => element.id == productItem.id);
  }
}
