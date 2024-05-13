import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';

class AuthOptions extends StatelessWidget {
  final VoidCallback googleOnTap;
  final VoidCallback appleOnTap;
  final VoidCallback twitterOnTap;
  final VoidCallback facebookOnTap;
  const AuthOptions({
    super.key,
    required this.googleOnTap,
    required this.appleOnTap,
    required this.twitterOnTap,
    required this.facebookOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: googleOnTap,
          child: Brand(
            Brands.google,
            size: 52.0,
          ),
        ),
        GestureDetector(
          onTap: appleOnTap,
          child: const Icon(
            BoxIcons.bxl_apple,
            size: 52.0,
          ),
        ),
        GestureDetector(
          onTap: twitterOnTap,
          child: Brand(
            Brands.twitter,
            size: 52.0,
          ),
        ),
        GestureDetector(
          onTap: facebookOnTap,
          child: Brand(
            Brands.facebook,
            size: 52.0,
          ),
        ),
      ],
    );
  }
}
