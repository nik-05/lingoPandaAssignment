import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingo_panda_assignment/core/common_widgets/app_button.dart';
import 'package:lingo_panda_assignment/core/common_widgets/app_text_field.dart';
import 'package:lingo_panda_assignment/core/utils/custom_alerts.dart';
import 'package:lingo_panda_assignment/core/utils/form_validator.dart';
import 'package:lingo_panda_assignment/features/auth/bloc/auth_bloc.dart';
import 'package:lingo_panda_assignment/features/auth/widgets/auth_redirect_text.dart';
import 'package:lingo_panda_assignment/features/comments/screens/comment_screen.dart';

class LoginScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const LoginScreen());
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void login() {
    if (formKey.currentState!.validate()) {
      print('login button Clicked');
      BlocProvider.of<AuthBloc>(context).add(AuthLogin(
          email: emailController.text.trim(),
          password: passwordController.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthErrorState) {
          CustomAlerts.showSnackBar(context, state.message);
        } else if (state is AuthUserLogin) {
          Navigator.pushAndRemoveUntil(context, CommentScreen.route(), (route) => false);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Form(
              key: formKey,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 16, right: 18, top: 30, bottom: 51),
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
                      children: [
                        AppTextField(
                          controller: emailController,
                          hintText: 'Email',
                          validator: FormValidator.emailValidator,
                        ),
                        const SizedBox(height: 19),
                        AppTextField(
                          controller: passwordController,
                          hintText: 'Password',
                          validator: FormValidator.passwordValidator,
                          isObscureText: true,
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        AppButton(
                          onPressed: login,
                          isLoading: state is AuthLoading,
                          text: 'Login',
                        ),
                        const SizedBox(height: 14),
                        AuthRedirectText(
                          onTap: () {
                            // Since can create a loop so I am popping out the login screen
                            Navigator.pop(context);
                          },
                          text1: 'New here? ',
                          text2: 'Signup',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
