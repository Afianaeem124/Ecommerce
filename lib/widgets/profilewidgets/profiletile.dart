import 'package:ecommerce_app/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileTile extends StatelessWidget {
  final Widget? leading;
  final String? title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? callback;
  const ProfileTile(
      {super.key,
      this.title,
      this.subtitle,
      this.callback,
      this.trailing = const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16,
      ),
      this.leading});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: callback,
          leading: leading,
          title: Text(
            "$title",
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            "$subtitle",
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 11),
          ),
          trailing: trailing,
          // titleTextStyle: GoogleFonts.metrophobic(fontSize: 16, color: white6),
          // subtitleTextStyle:
          //     GoogleFonts.metrophobic(fontSize: 11, color: greyLabelText),
          iconColor: greyLabelText,
        ),
        Divider(
          color: greyLightTextField.withOpacity(0.5),
        )
      ],
    );
  }
}
