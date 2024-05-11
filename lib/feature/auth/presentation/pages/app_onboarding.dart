import 'package:flutter/material.dart';
import 'package:inkwell/core/theme/app_colors.dart';
import 'package:inkwell/core/routes/routes.dart';
import 'package:inkwell/feature/auth/presentation/widgets/auth_scaffold.dart';
import 'package:inkwell/feature/auth/presentation/widgets/onboarding_button.dart';

class AppOnBoarding extends StatelessWidget {
  const AppOnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      showAppBar: false,
      widget: Expanded(
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              const Text(
                "InkWell",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 40.0,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primaryColor,
                ),
              ),
              Text(
                "Sign up or sign in to get started",
                style: TextStyle(
                  fontSize: 22.0,
                  color: AppColors.primaryColor.withOpacity(0.8),
                ),
              ),
              const Spacer(),
              Flexible(
                flex: 0,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(signInRoute);
                        },
                        child: const OnBoardingButton(
                          buttonText: 'Sign in',
                          buttonColor: Colors.transparent,
                          textColor: AppColors.primaryColor,
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushNamed(signUpRoute);
                        },
                        child: const OnBoardingButton(
                          buttonText: 'Sign up',
                          buttonColor: AppColors.secondaryColor,
                          textColor: AppColors.commonColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
