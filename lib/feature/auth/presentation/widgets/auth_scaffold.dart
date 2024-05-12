import 'package:flutter/material.dart';

class AuthScaffold extends StatelessWidget {
  final Widget widget;
  final bool showAppBar;
  final Widget? appBar;
  const AuthScaffold({
    super.key,
    required this.widget,
    this.showAppBar = true,
    this.appBar,
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
          if (showAppBar) appBar!,
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
