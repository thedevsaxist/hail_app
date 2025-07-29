import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hail/app/core/shared/button.dart';
import 'package:hail/app/core/shared/input_field.dart';
import 'package:hail/app/core/shared/phone_number_input_field.dart';
import 'package:hail/app/core/theme/gen/colors.gen.dart';
import 'package:hail/app/core/theme/layout/padding.dart';
import 'package:hail/app/core/theme/layout/rounded_border.dart';
import 'package:hail/app/core/theme/layout/spacing.dart';

@RoutePage()
class SignUpScreen extends ConsumerStatefulWidget {
  final void Function()? onPressed;
  const SignUpScreen({this.onPressed, super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(actions: [_LoginTextButton()]),
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

                  _GenderDropDown(),

                  PhoneNumberInputField(),

                  Spacer(),
                  Button(label: "Sign up"),

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

class _GenderDropDown extends StatefulWidget {
  @override
  State<_GenderDropDown> createState() => _GenderDropDownState();
}

class _GenderDropDownState extends State<_GenderDropDown> {
  String? _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Gender", style: TextTheme.of(context).bodyLarge),
        Spacing.vSmall,
        DropdownButtonFormField<String>(
          value: _selectedGender,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: RoundedBorder.b12,
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: RoundedBorder.b12,
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: RoundedBorder.b12,
              borderSide: BorderSide.none,
            ),
            fillColor: ColorName.inputFieldFill,
            filled: true,
            hintText: "Select Gender",
            hintStyle: TextStyle(color: ColorName.grayDarkmode),
          ),
          dropdownColor: ColorName.inputFieldFill,
          borderRadius: RoundedBorder.b12,
          icon: const Icon(Icons.keyboard_arrow_down), // Chevron down icon
          items: const [
            DropdownMenuItem(value: 'Male', child: Text('Male')),
            DropdownMenuItem(value: 'Female', child: Text('Female')),
          ],
          onChanged: (value) {
            setState(() {
              _selectedGender = value;
            });
          },
        ),
        Spacing.vMedium,
      ],
    );
  }
}

class _LoginTextButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.router.replacePath('/login'),
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Text(
            "Login",
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
