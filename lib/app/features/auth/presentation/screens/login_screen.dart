import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hail/app/core/routes/router.gr.dart';
import 'package:hail/app/core/theme/gen/assets.gen.dart';
import 'package:hail/app/core/theme/gen/colors.gen.dart';
import 'package:hail/app/core/theme/layout/padding.dart';
import 'package:hail/app/core/theme/layout/rounded_border.dart';
import 'package:hail/app/core/theme/layout/spacing.dart';
import 'package:hail/app/features/auth/presentation/state/login_screen_provider.dart';
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
    final viewmodel = ref.watch<ILoginScreenProvider>(loginScreenProvider);

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
                        "Let's get started",
                        style: TextTheme.of(
                          context,
                        ).headlineMedium?.copyWith(fontWeight: FontWeight.w600),
                      ),

                      Spacing.vSmall,

                      Text(
                        "This is your first step to enjoying comfortable and affordable rides with Hail.",
                        textAlign: TextAlign.center,
                        style: TextTheme.of(context).labelMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                          color: ColorName.grayDarkmode,
                        ),
                      ),

                      SizedBox(height: MediaQuery.sizeOf(context).height * 0.09),

                      _SocialAuthButton(
                        brand: Brands.google,
                        socialLabel: "Google",
                        onPressed: () {
                          viewmodel.googleLogin();
                          context.replaceRoute(HomeRoute());
                        },
                      ),

                      Spacing.vSmall,

                      _SocialAuthButton(
                        brand: Brands.apple_logo,
                        socialLabel: "Apple",
                        onPressed: () {},
                      ),
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
  final void Function() onPressed;
  const _SocialAuthButton({
    required this.socialLabel,
    required this.brand,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Makes the button fill horizontal space
      height: 55,
      child: ElevatedButton(
        onPressed: onPressed,
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
