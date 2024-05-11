import 'package:flutter/material.dart';

class OnBoardingButton extends StatefulWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  const OnBoardingButton({
    super.key,
    required this.buttonText,
    required this.buttonColor,
    required this.textColor,
  });

  @override
  State<OnBoardingButton> createState() => _OnBoardingButtonState();
}

class _OnBoardingButtonState extends State<OnBoardingButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: widget.buttonColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20.0),
            topLeft: Radius.circular(20.0),
          ),
        ),
        child: Text(
          widget.buttonText,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: widget.textColor,
          ),
        ),
      ),
    );
  }
}
