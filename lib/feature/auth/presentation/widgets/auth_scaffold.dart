import 'package:flutter/material.dart';
import 'package:inkwell/core/routes/routes.dart';
import 'package:inkwell/core/theme/app_colors.dart';

class AuthScaffold extends StatelessWidget {
  final Widget widget;
  final bool showAppBar;
  const AuthScaffold({
    super.key,
    required this.widget,
    this.showAppBar = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            'assets/onboarding_background.jpeg',
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          if (showAppBar)
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                leading: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(appOnBoardingRoute);
                  },
                  child: const Icon(
                    Icons.chevron_left,
                    color: AppColors.primaryColor,
                    size: 40.0,
                  ),
                ),
                title: const Text(
                  "Back",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          SafeArea(
            child: Column(
              children: [
                if (showAppBar) const SizedBox(height: 150.0),
                widget,
              ],
            ),
          ),
        ],
      ),
    );
  }
}
