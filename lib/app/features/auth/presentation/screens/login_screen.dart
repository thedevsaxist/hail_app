import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hail/app/core/theme/gen/assets.gen.dart';
import 'package:hail/app/core/theme/gen/colors.gen.dart';
import 'package:hail/app/core/theme/layout/padding.dart';
import 'package:hail/app/core/theme/layout/rounded_border.dart';
import 'package:hail/app/core/theme/layout/spacing.dart';
import 'package:icons_plus/icons_plus.dart';

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
        // appBar: AppBar(actions: [LoginAndSignupToggle(otherScreen: "Sign up")]),
        body: SafeArea(
          child: Padding(
            padding: AppPadding.h25,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Assets.logos.hailAppLogo3x.image(scale: 4),
                      Spacing.vMedium,
                      Text(
                        "Let's get you signed up",
                        style: TextTheme.of(
                          context,
                        ).headlineMedium?.copyWith(fontWeight: FontWeight.w600),
                      ),
                
                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.09),
                
                      _SocialAuthButton(brand: Brands.google, socialLabel: "Google"),
                
                      Spacing.vSmall,
                
                      _SocialAuthButton(brand: Brands.apple_logo, socialLabel: "Apple"),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Privacy Policy",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorName.grayDarkmode,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      "·",
                      style: Theme.of(
                        context,
                      ).textTheme.headlineMedium?.copyWith(color: ColorName.grayDarkmode),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Terms of Service",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: ColorName.grayDarkmode,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialAuthButton extends StatelessWidget {
  final String socialLabel;
  final String brand;
  const _SocialAuthButton({required this.socialLabel, required this.brand});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Makes the button fill horizontal space
      height: 55,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          // backgroundColor: ColorName.primary,
          shape: RoundedRectangleBorder(borderRadius: RoundedBorder.b12),
          side: BorderSide(width: 1, color: ColorName.darkBackground),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Brand(brand, size: 24),
            Text(
              "Continue with $socialLabel",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: ColorName.textColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(),
          ],
        ),
      ),
    );
  }
}
