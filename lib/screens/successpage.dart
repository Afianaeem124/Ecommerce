import 'package:ecommerce_app/widgets/general/buttons.dart';
import 'package:flutter/material.dart';

class Success extends StatefulWidget {
  const Success({super.key});

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Image.asset("imagepath"),
          Padding(
            padding: const EdgeInsets.only(top: 49),
            child: Text(
              "Success!",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              "Your order will be delivered soon.\nThank you for choosing our app!",
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 45),
            child: CustomButton(btnName: "Coninue Shopping", callback: () {}),
          )
        ],
      ),
    );
  }
}
