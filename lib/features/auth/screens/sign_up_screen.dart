import 'package:flutter/material.dart';
import 'package:lingo_panda_assignment/core/common_widgets/app_button.dart';
import 'package:lingo_panda_assignment/core/common_widgets/app_text_field.dart';
import 'package:lingo_panda_assignment/features/auth/widgets/auth_redirect_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 18, top: 30, bottom: 51),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text('Comments',
                    style: Theme.of(context).textTheme.titleLarge),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppTextField(controller: nameController, hintText: 'Name'),
                  const SizedBox(height: 19),
                  AppTextField(controller: emailController, hintText: 'Email'),
                  const SizedBox(height: 19),
                  AppTextField(
                      controller: passwordController, hintText: 'Password'),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppButton(onPressed: () {}, text: 'Signup'),
                  const SizedBox(height: 14),
                  AuthRedirectText(
                    onTap: () {},
                    text1: 'Already have an account? ',
                    text2: 'Login',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
