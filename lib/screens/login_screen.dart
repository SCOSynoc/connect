
import 'package:connect_with/screens/home_screen.dart';
import 'package:connect_with/widgets/custom_button.dart';
import 'package:connect_with/widgets/input_feilds.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../resources/auth_methods.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final AuthMethods _authMethods = AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Start or join a meeting',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 38.0),
                child: Image.asset('assets/images/onboarding.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: InputFeilds(textEditingController: emailController, hint: "Enter your email"),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: InputFeilds(textEditingController: passwordController, hint: "Enter password"),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CustomButton(
                    text: "Sign In",
                    onPressed: () async {
                      bool signed = await _authMethods.signInUserWithEmail(context, emailController.text, passwordController.text);
                      if(signed){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      }

                }),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: CustomButton(
                    text: "Log In",
                    onPressed: () async {
                      bool logged = await _authMethods.loginuserwithEmail(context, emailController.text, passwordController.text);
                      if(logged){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                      }
                    }),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
