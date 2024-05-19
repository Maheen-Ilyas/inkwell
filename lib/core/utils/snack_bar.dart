import 'package:flutter/material.dart';
import 'package:inkwell/core/theme/app_colors.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: AppColors.backgroundColor,
        content: Text(
          content,
          style: const TextStyle(
            fontSize: 20.0,
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
}
