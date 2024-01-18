import 'package:ecommerce_app/constants/colors.dart';
import 'package:ecommerce_app/widgets/general/appbar.dart';
import 'package:ecommerce_app/widgets/general/buttons.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool salesSwitch = true;
  bool arrivalSwitch = false;
  bool deliverySwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppbar(bgColor: Colors.transparent)
          .appbarwithback(context, "", false),

      // ShowAppBar(
      //   leadingIcon: Icons.arrow_back_ios_new_rounded,
      //   callback: () {
      //     Navigator.pop(context);
      //   },
      //   actionIcon: Icons.search,
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18, left: 14, bottom: 23),
              child: Text(
                "Settings",
                style: Theme.of(context).textTheme.displayLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Persional Information",
                      style: Theme.of(context).textTheme.bodyMedium),
                  Padding(
                    padding: const EdgeInsets.only(top: 21, bottom: 24),
                    child: _showTextField(context, 'Name', false),
                  ),
                  _showTextField(context, 'Date of Birth', false),
                  Padding(
                    padding: const EdgeInsets.only(top: 55),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Persional Information",
                            style: Theme.of(context).textTheme.bodyMedium),
                        TextButton(
                            onPressed: () {
                              _showBottomSheet(context);
                            },
                            child: Text("Change",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: greyLabelText,
                                        fontWeight: FontWeight.w500))),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 21, bottom: 55),
                    child: _showTextField(context, "Password", true),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 23),
                    child: Text(
                      "Notifications",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                  _togglerow(context, "Sales", salesSwitch),
                  _togglerow(context, "New arrivals", arrivalSwitch),
                  _togglerow(
                      context, "Delivery status changes", deliverySwitch),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showTextField(
      BuildContext context, String hintText, bool hiddenData) {
    return TextFormField(
      enabled: hintText == "Password" ? false : true,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14),
      cursorColor: white5,
      obscureText: hiddenData,
      decoration: InputDecoration(
        labelText: hintText,
      ),
    );
  }

  Widget _togglerow(BuildContext context, String togglename, bool isSwitched) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              togglename,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
            Switch(
              value: isSwitched,
              activeColor: greenprofile,
              onChanged: (bool value) {
                setState(() {
                  if (togglename == "Sales") {
                    salesSwitch = value;
                  } else if (togglename == "New arrivals") {
                    arrivalSwitch = value;
                  } else if (togglename == "Delivery status changes") {
                    deliverySwitch = value;
                  }
                });
              },
            )
          ],
        ),
        const SizedBox(height: 24)
      ],
    );
  }

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      elevation: 0,
      context: context,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(34),
      )),
      backgroundColor: greyScaffoldbf,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Padding(
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
                      "Password Change",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 18),
                    )),
                _showTextField(context, 'Old Password', false),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: Theme.of(context).textTheme.bodySmall,
                        )),
                  ),
                ),
                _showTextField(context, "New Password", true),
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 32),
                  child: _showTextField(context, 'Repeat New Password', true),
                ),
                CustomButton(
                  btnName: "SAVE PASSWORD",
                  // leftMargin: 16,
                  // rightMargin: 16,
                  topMargin: 5,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
