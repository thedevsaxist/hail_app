import 'package:flutter/material.dart';
import 'package:hail/app/core/theme/gen/colors.gen.dart';
import 'package:hail/app/core/theme/layout/rounded_border.dart';

class Button extends StatefulWidget {
  final void Function()? onPressed;
  final String label;
  const Button({super.key, this.onPressed, required this.label});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, // Makes the button fill horizontal space
      height: 55,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorName.primary,
          shape: RoundedRectangleBorder(borderRadius: RoundedBorder.b12),
        ),
        child: Text(
          widget.label,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            color: ColorName.lightBackground,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
