import 'package:flutter/material.dart';
import 'package:hail/app/core/theme/gen/colors.gen.dart';
import 'package:hail/app/core/theme/layout/rounded_border.dart';
import 'package:hail/app/core/theme/layout/spacing.dart';

class InputField extends StatefulWidget {
  final String hintText;
  final String label;
  const InputField({super.key, required this.hintText, required this.label});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: TextTheme.of(context).bodyLarge),
        Spacing.vSmall,
        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: RoundedBorder.b12,
              borderSide: BorderSide.none,
            ),
            fillColor: ColorName.inputFieldFill,
            filled: true,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: ColorName.grayDarkmode),
          ),
        ),
        Spacing.vSmall,
      ],
    );
  }
}
