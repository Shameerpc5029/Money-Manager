import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.suffix,
    required this.prefixIcon,
    required this.textInputType,
  });
  final TextInputType textInputType;
  final IconData prefixIcon;
  final String labelText;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: textInputType,
      decoration: InputDecoration(
        // suffixIcon: Icon(suffixIcon),
        prefixIcon: Icon(prefixIcon),
        suffix: suffix,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        labelText: labelText,
      ),
    );
  }
}
