import 'package:flutter/material.dart';
import 'package:inkwell/core/theme/app_colors.dart';

class AuthNavigationText extends StatelessWidget {
  final String text;
  final String navigationText;
  final VoidCallback onTap;
  const AuthNavigationText({
    super.key,
    required this.text,
    required this.navigationText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        const SizedBox(width: 3.0),
        InkWell(
          onTap: onTap,
          child: Text(
            navigationText,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
