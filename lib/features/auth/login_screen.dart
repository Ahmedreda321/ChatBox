import 'package:chatbox/logic/cubits/auth_cubit/auth_cubit.dart';
import 'package:chatbox/features/auth/forgot_screen.dart';
import 'package:chatbox/features/auth/sign_up_screen.dart';
import 'package:chatbox/features/auth/widgets/forgot_password.dart';
import 'package:chatbox/features/auth/widgets/my_text_fild.dart';
import 'package:chatbox/features/auth/widgets/mybotton.dart';
import 'package:chatbox/features/auth/widgets/mytext_rich.dart';
import 'package:chatbox/features/auth/widgets/or.dart';
import 'package:chatbox/features/auth/widgets/password_fild.dart';
import 'package:chatbox/features/auth/widgets/question_and_botton.dart';
import 'package:chatbox/features/auth/widgets/sign_with.dart';
import 'package:chatbox/features/home/home_page.dart';
import 'package:chatbox/core/utils/space_widget.dart';
import 'package:chatbox/features/auth/widgets/pages_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String id = 'login';

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    String? email, password;

    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Form(
        key: formKey,
        child: PagesBody(
          // formKey: formKey,
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: [
            const VSpace(value: 14),
            const MyTextRich(
              text: 'Welcome to ',
              textSpan: 'Chatbox',
              discribtion:
                  'Welcome back! Sign in using your social account or email to continue us',
            ),
            MyTextFild(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
                onChanged: (value) => email = value,
                labelText: 'Email'),
            PasswordFild(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
                onChanged: (value) => password = value,
                labelText: 'Password'),
            Forgot(
              onPressed: () {
                Navigator.pushNamed(context, ForgotScreen.id);
              },
            ),
            BlocConsumer<AuthCubit, AuthState>(
              listener: (context, state) {
                if (state is LoginSuccess) {
                  Navigator.pushNamed(context, HomePage.id);
                } else if (state is LoginError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.message)),
                  );
                }
              },
              builder: (context, state) {
                if (state is LoginLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return MyBotton(
                  minimumSize: const Size(double.infinity, 50),
                  text: 'Log in',
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      context.read<AuthCubit>().logIn(email!, password!);
                    }
                  },
                );
              },
            ),
            const QuestionAndBotton(
                question: 'Don\'t have an account?',
                screenName: SignUpScreen.id,
                bottonText: 'Sign up'),
            const Or(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SignWithGoogel(
                  onPressed: () {},
                ),
                SignWithFacebook(
                  onPressed: () {},
                ),
              ],
            ),
            const VSpace(value: 14),
          ],
        ),
      ),
    );
  }
}
