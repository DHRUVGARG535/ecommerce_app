import 'package:flutter/material.dart';

class SettingsMenuTile extends StatelessWidget {
  const SettingsMenuTile({
    super.key,
    required this.title,
    required this.subTitle,
    this.icon,
    required this.func,
  });

  final String title;
  final String subTitle;
  final IconData? icon;
  final VoidCallback func;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(title, style: Theme.of(context).textTheme.headlineSmall),
        subtitle: Text(subTitle, style: Theme.of(context).textTheme.bodyMedium),
        leading: Icon(icon),
      ),
    );
  }
}
