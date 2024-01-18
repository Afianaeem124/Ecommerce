import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter/material.dart';

class ShowAssetButton extends StatelessWidget {
  const ShowAssetButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _showAssetButton('google', () {}),
        const SizedBox(
          width: 16,
        ),
        _showAssetButton('facebook', () {}),
      ],
    );
  }

  Widget _showAssetButton(String imgpath, VoidCallback? callback) {
    return InkWell(
      onTap: callback,
      child: Container(
        width: 92,
        height: 64,
        decoration: ShapeDecoration(
          color: whiteonly,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: Center(child: Image.asset('assets/$imgpath.png')),
      ),
    );
  }
}
