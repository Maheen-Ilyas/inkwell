import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inkwell/core/common/widgets/loading.dart';
import 'package:inkwell/core/theme/app_colors.dart';
import 'package:inkwell/core/routes/routes.dart';
import 'package:inkwell/core/utils/snack_bar.dart';
import 'package:inkwell/feature/auth/presentation/bloc/auth_bloc.dart';
import 'package:inkwell/feature/auth/presentation/widgets/auth_button.dart';
import 'package:inkwell/feature/auth/presentation/widgets/auth_field.dart';
import 'package:inkwell/feature/auth/presentation/widgets/auth_navigation_text.dart';
import 'package:inkwell/feature/auth/presentation/widgets/auth_options.dart';
import 'package:inkwell/feature/auth/presentation/widgets/auth_scaffold.dart';
import 'package:inkwell/feature/auth/presentation/widgets/auth_separator.dart';

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
                  BlocConsumer<AuthBloc, AuthState>(
                    listener: (context, state) {
                      if (state is AuthFailure) {
                        showSnackBar(
                          context,
                          state.message,
                        );
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        const Loading();
                      }
                      return Form(
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
                            AuthButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  context.read<AuthBloc>().add(
                                        AuthSignUp(
                                          name: _name.text.trim(),
                                          email: _email.text.trim(),
                                          password: _password.text.trim(),
                                        ),
                                      );
                                }
                              },
                              buttonText: 'Sign up',
                            ),
                            const SizedBox(height: 20.0),
                            const AuthSeparator(
                              dividerText: "Sign up with",
                            ),
                            const SizedBox(height: 20.0),
                            AuthOptions(
                              googleOnTap: () {
                                // TODO: Google Sign up
                              },
                              appleOnTap: () {
                                // TODO: Apple Sign up
                              },
                              twitterOnTap: () {
                                // TODO: Twitter Sign up
                              },
                              facebookOnTap: () {
                                // TODO: Facebook Sign up
                              },
                            ),
                            const SizedBox(height: 20.0),
                            AuthNavigationText(
                              text: "Already have an account?",
                              navigationText: 'Sign in here!',
                              onTap: () {
                                Navigator.of(context).pushNamed(signInRoute);
                              },
                            ),
                          ],
                        ),
                      );
                    },
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
