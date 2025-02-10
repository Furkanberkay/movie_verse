import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:movie_verse/common/helper/message/display_message.dart';
import 'package:movie_verse/common/helper/navigation/app_navigation.dart';
import 'package:movie_verse/core/configs/theme/app_colors.dart';
import 'package:movie_verse/data/auth/models/signin_req_params.dart';
import 'package:movie_verse/domain/auth/usercases/signin.dart';
import 'package:movie_verse/presentation/auth/pages/signup.dart';
import 'package:movie_verse/presentation/home/pages/home.dart';
import 'package:movie_verse/service_locator.dart';
import 'package:reactive_button/reactive_button.dart';

class SigninPage extends StatelessWidget {
   SigninPage({super.key});

  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passwordCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: EdgeInsets.only(top: 100, right: 16, left: 16) ,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _signinText(),
              const SizedBox(height: 30,),
              _emailField(),
              const SizedBox(height: 20,),
              _passwordField(),
              const SizedBox(height: 60,),
              _siginButton(context),
              const SizedBox(height: 20,),
              _signupText(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _signinText() {
    return Text(
      'Sign In',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 24,
    ),
    );
  }

  Widget _emailField() {
    return  TextField(
      controller: _emailCon,
      decoration: const InputDecoration(
        hintText: 'Email'
      ),
    );
  }

  Widget _passwordField() {
    return TextField(
      controller: _passwordCon,
      decoration: const InputDecoration(
          hintText: 'PassWord'
      ),
    );
  }

  Widget _siginButton(BuildContext context) {
    return ReactiveButton(
      title: 'Sign In',
        activeColor: AppColors.primary,
        onPressed: () async =>  sl<SigninUseCase>().call(
          params: SigninReqParams(
              email: _emailCon.text,
              password: _passwordCon.text,
          )
        ),
        onSuccess: () {
        AppNavigator.pushAndRemove(context, const HomePage());
        },
        onFailure: (error) {
          DisplayMessage.errorMessage(error, context);
        },
    );
  }

  Widget _signupText(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "Don't you have account? "
          ),
          TextSpan(
            text: "Sign Up",
            style: TextStyle(color: Colors.blue
            ),
            recognizer: TapGestureRecognizer()..onTap = () {
              AppNavigator.push(context,  SignupPage());

            }
          ),
        ]
      ),
    );
  }
}
