import 'package:ecommerce_app/widgets/general/appbar.dart';
import 'package:ecommerce_app/widgets/general/buttons.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class ShippingAddress extends StatefulWidget {
  const ShippingAddress({super.key});

  @override
  State<ShippingAddress> createState() => _ShippingAddressState();
}

class _ShippingAddressState extends State<ShippingAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(bgColor: Colors.transparent)
          .appbarwithback(context, "Adding Shipping Address", false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 35),
              _showTextField("Full Name"),
              _showTextField("Address"),
              _showTextField("City"),
              _showTextField("State/Province/Region"),
              _showTextField("Zip Code (Postal Code)"),
              _showTextField("Country"),
              const SizedBox(height: 20),
              CustomButton(btnName: "SAVE ADDRESS", callback: () {})
            ],
          ),
        ),
      ),
    );
  }

  Widget _showTextField(String hintText) {
    return Column(
      children: [
        TextFormField(
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14),
          enabled: true,
          keyboardType:
              hintText == "Country" ? TextInputType.number : TextInputType.text,
          textInputAction: hintText == "Country"
              ? TextInputAction.done
              : TextInputAction.next,
          cursorColor: white5,
          decoration: InputDecoration(
            labelText: hintText,
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }
}
