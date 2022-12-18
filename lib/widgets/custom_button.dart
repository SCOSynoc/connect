import 'package:connect_with/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomButton({Key? key, required this.text, required this.onPressed, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        child: Text(text,
      style: TextStyle(fontSize: 17),
      ),
        style: ElevatedButton.styleFrom(
        primary: buttonColor,
          minimumSize:  const Size(double.infinity, 50.0)

    ),
    );
  }
}
