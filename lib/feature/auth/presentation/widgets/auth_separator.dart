import 'package:flutter/material.dart';
import 'package:inkwell/core/theme/app_colors.dart';

class AuthSeparator extends StatelessWidget {
  final String dividerText;
  const AuthSeparator({
    super.key,
    required this.dividerText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            thickness: 1.0,
            color: AppColors.primaryColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 10.0,
          ),
          child: Text(
            dividerText,
            style: const TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            thickness: 1.0,
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
