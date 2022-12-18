

import 'package:flutter/material.dart';

class InputFeilds extends StatelessWidget {
  final TextEditingController textEditingController;
  final String hint;
  InputFeilds({Key? key, required this.textEditingController, required this.hint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController ,
      decoration: InputDecoration(
        hintText: hint
      ),
    );
  }
}
