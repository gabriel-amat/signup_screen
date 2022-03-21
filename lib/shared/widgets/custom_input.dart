import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_ui_app/shared/theme/app_colors.dart';

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String labelText;
  final String hintText;
  final bool obscureText;
  final bool autoCorrect;
  final TextInputType keyboardType;
  final String? Function(String?) validator;
  final List<TextInputFormatter>? mask;

  const CustomInput({
    Key? key,
    this.mask,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    required this.hintText,
    required this.validator,
    required this.controller,
    required this.icon,
    required this.labelText,
    required this.autoCorrect,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: TextFormField(
        keyboardType: keyboardType,
        obscureText: obscureText,
        autocorrect: autoCorrect,
        inputFormatters: mask,
        style: const TextStyle(
          fontFamily: 'Montserrat',
          fontWeight: FontWeight.bold,
          color: AppColors.compBlue,
        ),
        validator: validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: const TextStyle(color: Colors.grey),
          labelStyle: const TextStyle(color: Colors.grey),
          hintText: hintText,
          labelText: labelText,
          prefixIcon: Icon(
            icon,
            color: AppColors.compBlue,
          ),
        ),
      ),
    );
  }
}
