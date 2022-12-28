import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/auth_methods.dart';
import '../widgets/custom_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(child: CustomButton(text: 'Log Out', onPressed: () => AuthMethods().logoutUser())),
            ],
          ),
        ),
      ),
    );
  }
}
