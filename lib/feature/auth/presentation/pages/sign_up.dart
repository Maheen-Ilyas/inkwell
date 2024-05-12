import 'package:flutter/material.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:inkwell/core/theme/app_colors.dart';
import 'package:inkwell/core/routes/routes.dart';
import 'package:inkwell/feature/auth/presentation/widgets/auth_button.dart';
import 'package:inkwell/feature/auth/presentation/widgets/auth_field.dart';
import 'package:inkwell/feature/auth/presentation/widgets/auth_scaffold.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // _formKey.currentState!.validate();
    return AuthScaffold(
      appBar: Positioned(
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
      widget: Expanded(
        child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40.0),
              topRight: Radius.circular(40.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Text(
                    "Get Started",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 26.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        AuthField(
                          controller: _name,
                          obscureText: false,
                          hintText: 'Name',
                        ),
                        const SizedBox(height: 20.0),
                        AuthField(
                          controller: _email,
                          obscureText: false,
                          hintText: 'Email',
                        ),
                        const SizedBox(height: 20.0),
                        AuthField(
                          controller: _password,
                          obscureText: true,
                          hintText: 'Password',
                        ),
                        const SizedBox(height: 20.0),
                        const AuthButton(
                          buttonText: 'Sign up',
                        ),
                        const SizedBox(height: 20.0),
                        const Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1.0,
                                color: AppColors.primaryColor,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 0,
                                horizontal: 10.0,
                              ),
                              child: Text(
                                "Sign up with",
                                style: TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                thickness: 1.0,
                                color: AppColors.primaryColor,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {
                                // TODO: Enable Google Sign up
                              },
                              child: Brand(
                                Brands.google,
                                size: 52.0,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // TODO: Enable Apple Sign in
                              },
                              child: const Icon(
                                BoxIcons.bxl_apple,
                                size: 52.0,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // TODO: Enable Twitter Sign in
                              },
                              child: Brand(
                                Brands.twitter,
                                size: 52.0,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // TODO: Enable Facebook Sign in
                              },
                              child: Brand(
                                Brands.facebook,
                                size: 52.0,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(width: 3.0),
                            InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed(signInRoute);
                              },
                              child: const Text(
                                'Sign in here!',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
