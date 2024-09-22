import 'package:chatbox/logic/cubits/auth_cubit/auth_cubit.dart';
import 'package:chatbox/features/auth/widgets/header.dart';
import 'package:chatbox/features/auth/widgets/my_text_fild.dart';
import 'package:chatbox/features/auth/widgets/mybotton.dart';
import 'package:chatbox/features/auth/widgets/or.dart';
import 'package:chatbox/features/auth/widgets/password_fild.dart';
import 'package:chatbox/features/auth/widgets/question_and_botton.dart';
import 'package:chatbox/features/auth/widgets/sign_with.dart';
import 'package:chatbox/core/utils/space_widget.dart';
import 'package:chatbox/features/auth/widgets/pages_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static const String id = 'signup';

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return Form(
            key: _formKey,
            child: PagesBody(
              showBackIcon: true,
              body: [
                const VSpace(value: 8.25),
                const Header(
                    top: 'Sign up with Email',
                    discribtion:
                        'Get chatting with friends and family today by signing up for our chat app!'),
                MyTextFild(
                  controller: _nameController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                  labelText: 'Your name',
                ),
                MyTextFild(
                  controller: _emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  labelText: 'Your email',
                ),
                PasswordFild(
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                  labelText: 'Your password',
                ),
                PasswordFild(
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (value == null) {
                      return 'Please confirm your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    } else if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                    return null;
                  },
                  labelText: 'Confirm your password',
                ),
                const VSpace(value: 3),
                BlocConsumer<AuthCubit, AuthState>(
                  listener: (context, state) {
                    if (state is SignUpSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Account created successfully!'),
                        ),
                      );
                      Navigator.pop(context);
                    } else if (state is SignUpError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.message),
                        ),
                      );
                    }
                  },
                  builder: (context, state) {
                    if (state is SignUpLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    return MyBotton(
                      minimumSize: const Size(double.infinity, 50),
                      text: 'Create Account',
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().signUp(
                                email: _emailController.text,
                                password: _passwordController.text,
                                name: _nameController.text,
                              );
                        }
                      },
                    );
                  },
                ),
                const QuestionAndBotton(
                  question: 'Already have an account?',
                  isLogin: true,
                  bottonText: 'Log in',
                ),
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
                const VSpace(value: 8.25),
              ],
            ),
          );
        },
      ),
    );
  }
}
