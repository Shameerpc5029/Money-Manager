import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    this.suffix,
    required this.prefixIcon,
    required this.textInputType,
    required this.textEditingController,
    this.validator,
  });
  final TextInputType textInputType;
  final IconData prefixIcon;
  final String labelText;
  final Widget? suffix;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: validator,
      keyboardType: textInputType,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon),
        suffix: suffix,
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        labelText: labelText,
      ),
    );
  }
}
