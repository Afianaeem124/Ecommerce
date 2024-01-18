import 'package:ecommerce_app/widgets/general/bottombar.dart';
import 'package:ecommerce_app/widgets/general/buttons.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Success extends StatefulWidget {
  const Success({super.key});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Lottie.asset("animation/ecommerce_Success.json",
                width: double.infinity),
            Text(
              "Success!",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            const SizedBox(height: 12),
            Text(
              "Your order will be delivered soon.\nThank you for choosing our app!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const Spacer(),
            CustomButton(
              bottomMargin: 30,
              btnName: "Coninue Shopping",
              callback: toHomePage,
              leftMargin: 18,
              rightMargin: 14,
            ),
          ],
        ),
      ),
    );
  }

  void toHomePage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Bottombardown()));
  }
}
