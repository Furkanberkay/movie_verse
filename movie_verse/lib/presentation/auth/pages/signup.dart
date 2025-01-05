import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_verse/common/helper/navigation/app_navigation.dart';
import 'package:movie_verse/core/configs/theme/app_colors.dart';
import 'package:movie_verse/presentation/auth/pages/signin.dart';
import 'package:reactive_button/reactive_button.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 100, right: 16, left: 16) ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _signupText(),
            const SizedBox(height: 30,),
            _emailField(),
            const SizedBox(height: 20,),
            _passwordField(),
            const SizedBox(height: 60,),
            _siginButton(),
            const SizedBox(height: 20,),
            _siginText(context),
          ],
        ),
      ),
    );
  }

  Widget _signupText() {
    return Text(
      'Sign Up',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
      ),
    );
  }

  Widget _emailField() {
    return TextField(
      decoration: InputDecoration(
          hintText: 'Email'
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      decoration: InputDecoration(
          hintText: 'PassWord'
      ),
    );
  }

  Widget _siginButton() {
    return ReactiveButton(
      title: 'Sign In',
      activeColor: AppColors.primary,
      onPressed: () async {} ,
      onSuccess: () {},
      onFailure: (error) {},
    );
  }

  Widget _siginText(BuildContext context) {
    return Text.rich(
      TextSpan(
          children: [
            TextSpan(
                text: "Don't you have account? "
            ),
            TextSpan(
                text: "Sign In",
                style: TextStyle(color: Colors.blue
                ),
                recognizer: TapGestureRecognizer()..onTap = () {
                  AppNavigator.push(context, const SigninPage());

                }
            ),
          ]
      ),
    );
  }
}

