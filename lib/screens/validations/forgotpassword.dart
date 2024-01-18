
import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/widgets/general/appbar.dart';
import 'package:ecommerce_app/widgets/general/buttons.dart';
import 'package:ecommerce_app/widgets/validations/textfields.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailFormKey = GlobalKey<FormState>();
  bool shouldAutoValidateEmail = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppbar(bgColor: Colors.transparent)
            .appbarwithback(context, "", false),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(top: 18, left: 14),
                child: Text("Forgot password",
                    style: Theme.of(context).textTheme.displayLarge)),
            Padding(
              padding: const EdgeInsets.only(top: 87, left: 15),
              child: Text(
                  'Please, enter your email address. You will receive a link to create a new password via email.',
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: white6)),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                child: Form(
                  key: _emailFormKey,
                  autovalidateMode: shouldAutoValidateEmail
                      ? AutovalidateMode.onUserInteraction
                      : AutovalidateMode.disabled,
                  child: ShowTextField(
                    moveToNextTextField: TextInputAction.done,
                    textHint: 'Email',
                    onFieldSubmitted: (p0) {
                      setState(() {
                        shouldAutoValidateEmail = true;
                      });
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This field is required";
                      } else if (!value.contains('@') &&
                          !value.contains('.com')) {
                        return "Not a valid email address. Should be your@email.com";
                      } else {
                        return null;
                      }
                    },
                  ),
                )),
            Padding(
              padding: const EdgeInsets.only(top: 70, right: 16, left: 16),
              child: CustomButton(
                btnName: "SEND",
                // text: "SEND",
                callback: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}