import 'package:flutter/material.dart';

class categoryBar extends StatelessWidget {
  final String categoryName;
  final VoidCallback callback;
  categoryBar({required this.categoryName, required this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: ListTile(
        title: Text(
          categoryName,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontWeight: null),
        ),
      ),
    );
  }
}
