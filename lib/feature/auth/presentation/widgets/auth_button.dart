import 'package:flutter/material.dart';
import 'package:inkwell/core/theme/app_colors.dart';

class AuthButton extends StatelessWidget {
  final String buttonText;
  const AuthButton({
    super.key,
    required this.buttonText,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // TODO: Sign up logic
        },
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(
            AppColors.secondaryColor,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Text(
            buttonText,
            style: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.w500,
              color: AppColors.commonColor,
            ),
          ),
        ),
      ),
    );
  }
}
