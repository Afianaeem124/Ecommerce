import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/screens/shippingaddress.dart';
import 'package:ecommerce_app/screens/success.dart';
import 'package:ecommerce_app/widgets/general/appbar.dart';
import 'package:ecommerce_app/widgets/general/buttons.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(bgColor: Colors.transparent)
          .appbarwithback(context, "Checkout", false),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 31, left: 16, right: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Shipping address",
                  style: Theme.of(context).textTheme.bodyMedium),
              Container(
                width: double.infinity,
                height: 108,
                margin: const EdgeInsets.only(top: 21, bottom: 57),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: tabtext,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 18, left: 28, right: 23),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Jane Doe",
                              style: Theme.of(context).textTheme.bodyMedium),
                          _textButton(
                              "Change", () => toShippingAddressPage(context)),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Text(
                          "3 Newbridge Court \nChino Hills, CA 91709, United States",
                          style: Theme.of(context).textTheme.labelSmall,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 23, bottom: 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Payment",
                        style: Theme.of(context).textTheme.bodyMedium),
                    _textButton("Change", () => _showBottomSheet(context)),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 64,
                    height: 38,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), color: white),
                    child: Center(
                      child: Image.asset(
                        "assets/paymentcards/mastercard.png",
                      ),
                    ),
                  ),
                  const SizedBox(width: 17),
                  Text("**** **** **** 3947",
                      style: Theme.of(context).textTheme.bodySmall)
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 51, bottom: 21),
                child: Text("Delivery method",
                    style: Theme.of(context).textTheme.bodyMedium),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _imageContainer("fedex"),
                  _imageContainer("usps"),
                  _imageContainer("dhl"),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 52, bottom: 14),
                child: _showText(
                    "Order:",
                    "112\$",
                    Theme.of(context).textTheme.bodySmall,
                    Theme.of(context).textTheme.bodyMedium),
              ),
              _showText(
                  "Delivery:",
                  "15\$",
                  Theme.of(context).textTheme.bodySmall,
                  Theme.of(context).textTheme.bodyMedium),
              Padding(
                  padding: const EdgeInsets.only(top: 17, bottom: 26),
                  child: _showText(
                    "Summary:",
                    "127\$",
                    Theme.of(context).textTheme.bodySmall,
                    Theme.of(context).textTheme.bodyMedium,
                  )),
              Container(height: 20),
              CustomButton(
                  btnName: "SUBMIT ORDER",
                  callback: () => toSuccessPage(context)),
              const SizedBox(height: 30)
            ],
          ),
        ),
      ),
    );
  }

  Widget _textButton(String textName, VoidCallback callback) {
    return InkWell(
      onTap: callback,
      child: Text(textName,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: redIconwithButton)),
    );
  }

  Widget _imageContainer(String imgPath) {
    return Container(
      width: 100,
      height: 70,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(8), color: white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/paymentcards/$imgPath.png"),
          Text("2-3 days",
              style:
                  Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 11))
        ],
      ),
    );
  }

  Widget _showText(
    String keyText,
    String valueText,
    TextStyle? keystyle,
    TextStyle? valuestyle,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(keyText, style: keystyle),
        Text(valueText, style: valuestyle),
      ],
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      elevation: 0,
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(34),
      )),
      backgroundColor: bottomSheetBgcolor,
      isScrollControlled: true,
      builder: (context) {
        return Container(
          padding: EdgeInsets.fromLTRB(
              16, 14, 16, MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  width: 60,
                  height: 6,
                  decoration: BoxDecoration(
                    color: greyLabelText,
                    borderRadius: BorderRadius.circular(3),
                  )),
              Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 18),
                  child: Text(
                    "Add new card",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 18),
                  )),
              _showTextField(context, 'Name on card', TextInputType.text),
              _showTextField(context, 'Card number', TextInputType.number),
              _showTextField(context, 'Expire Date', TextInputType.text),
              _showTextField(context, 'CVV', TextInputType.number),
              Padding(
                padding: const EdgeInsets.only(top: 9, bottom: 22),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "☑\t\tSet as default payment method",
                    style: Theme.of(context)
                        .textTheme
                        .labelMedium!
                        .copyWith(color: white6),
                  ),
                ),
              ),
              CustomButton(btnName: "ADD CARD", callback: () {}),
              const SizedBox(height: 35)
            ],
          ),
        );
      },
    );
  }

  Widget _showTextField(
      BuildContext context, String hintText, TextInputType inputType) {
    return Column(
      children: [
        TextFormField(
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14),
          enabled: true,
          keyboardType: inputType,
          textInputAction:
              hintText == "CV" ? TextInputAction.done : TextInputAction.done,
          cursorColor: white5,
          decoration: InputDecoration(
            suffixIcon: hintText == "Card number"
                ? Padding(
                    padding: const EdgeInsets.only(right: 16),
                    child: Image.asset(
                      "assets/paymentcards/mastercard.png",
                      width: 32,
                      height: 25,
                    ),
                  )
                : hintText == "CVV"
                    ? Padding(
                        padding: const EdgeInsets.only(right: 19),
                        child: Icon(
                          Icons.help_outline,
                          size: 20,
                          color: greyLabelText,
                        ),
                      )
                    : null,
            labelText: hintText,
          ),
        ),
        const SizedBox(height: 20)
      ],
    );
  }

  void toShippingAddressPage(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => const ShippingAddress()));
  }

  void toSuccessPage(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Success()));
  }
}
