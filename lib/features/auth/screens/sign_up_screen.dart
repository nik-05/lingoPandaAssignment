import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lingo_panda_assignment/core/common_widgets/app_button.dart';
import 'package:lingo_panda_assignment/core/common_widgets/app_text_field.dart';
import 'package:lingo_panda_assignment/core/utils/custom_alerts.dart';
import 'package:lingo_panda_assignment/core/utils/form_validator.dart';
import 'package:lingo_panda_assignment/features/auth/bloc/auth_bloc.dart';
import 'package:lingo_panda_assignment/features/auth/widgets/auth_redirect_text.dart';
import 'package:lingo_panda_assignment/features/comments/screens/comment_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // Global Key for form and to validate it.
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Signup Function
  void signup() {
    if (formKey.currentState!.validate()) {
      BlocProvider.of<AuthBloc>(context).add(AuthSignup(
          name: nameController.text.trim(),
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
          Navigator.push(context, CommentScreen.route());
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
                          controller: nameController,
                          hintText: 'Name',
                          validator: FormValidator.nameValidator,
                        ),
                        const SizedBox(height: 19),
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
                          onPressed: signup,
                          isLoading: state is AuthLoading,
                          text: 'Signup',
                        ),
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
          ),
        );
      },
    );
  }
}
