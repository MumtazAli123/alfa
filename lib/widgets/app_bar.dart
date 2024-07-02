import 'package:flutter/material.dart';

class AppBarRow extends StatelessWidget {
  final String? title;
  final List<Widget>? actions;
  final Widget? leading;
   const AppBarRow({super.key, this.title, this.actions, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title ?? ''),
      actions: actions,
      leading: leading,
    );
  }
}
