import 'package:flutter/material.dart';
import 'package:inkwell/core/routes/routes.dart';
import 'package:inkwell/feature/auth/presentation/pages/app_onboarding.dart';
import 'package:inkwell/feature/auth/presentation/pages/sign_in.dart';
import 'package:inkwell/feature/auth/presentation/pages/sign_up.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InkWell',
      debugShowCheckedModeBanner: false,
      routes: {
        appOnBoardingRoute: (context) => const AppOnBoarding(),
        signInRoute: (context) => const SignIn(),
        signUpRoute: (context) => const SignUp(),
      },
      home: const AppOnBoarding(),
    );
  }
}
