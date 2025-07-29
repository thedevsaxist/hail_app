import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hail/app/core/shared/button.dart';
import 'package:hail/app/core/shared/input_field.dart';
import 'package:hail/app/core/shared/login_and_signup_toggle.dart';
import 'package:hail/app/core/theme/layout/padding.dart';
import 'package:hail/app/core/theme/layout/spacing.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  final void Function()? onPressed;
  const LoginScreen({this.onPressed, super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(actions: [LoginAndSignupToggle(otherScreen: "Sign up")]),
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: AppPadding.h25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome to Hail. \nLet's get you signed up",
                    style: TextTheme.of(context).headlineMedium,
                  ),

                  Spacing.vLarge,
                  InputField(hintText: "First Name", label: "First Name"),
                  InputField(hintText: "Last Name", label: "Last Name"),
                  InputField(hintText: "Email", label: "Email"),

                  Spacer(),
                  Button(label: "Log in"),

                  // Spacing.vLarge,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
