import 'package:flutter/material.dart';
import 'package:inkwell/core/theme/app_colors.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.primaryColor,
        backgroundColor: AppColors.commonColor,
      ),
    );
  }
}
