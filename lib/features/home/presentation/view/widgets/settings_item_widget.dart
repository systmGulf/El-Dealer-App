import 'package:flutter/material.dart';

class SettingsItemWidget extends StatelessWidget {
  const SettingsItemWidget({
    super.key,
    required this.leadingIcon,
    required this.trailingIcon,
    required this.title,
    this.onTap,
  });
  final Widget leadingIcon;
  final Widget trailingIcon;
  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          side: BorderSide(color: Color(0x33FFFFFF), width: 2),
        ),
        leading: leadingIcon,
        trailing: trailingIcon,

        title: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Satoshi',
            fontWeight: FontWeight.w700,
            letterSpacing: 0.02,
          ),
        ),
      ),
    );
  }
}
