import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hail/app/core/theme/gen/colors.gen.dart';

class LoginAndSignupToggle extends StatelessWidget {
  final String otherScreen;
  const LoginAndSignupToggle({super.key, required this.otherScreen});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.router.replacePath('/${otherScreen.toLowerCase()}'),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Text(
            otherScreen,
            style: TextTheme.of(
              context,
            ).bodyLarge?.copyWith(color: ColorName.primary, decoration: TextDecoration.none),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -1, // Increased space between text and underline
            child: Container(height: 2, color: ColorName.primary),
          ),
        ],
      ),
    );
  }
}
