import 'package:flutter/material.dart';

class ItemTextField extends StatelessWidget {
  const ItemTextField(
      {super.key,
      this.textController,
      required this.hintText,
      required this.prefixIcon,
      this.suffixIcon,
      this.validator,
      this.obscureText,
      required this.isPasswordVisible});

  final TextEditingController? textController;
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final dynamic validator;
  final bool? obscureText;
  final bool isPasswordVisible;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextFormField(
        controller: textController,
        validator: validator,
        obscureText: !isPasswordVisible,
        decoration: InputDecoration(
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          filled: true,
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}

class ItemTextField2 extends StatelessWidget {
  const ItemTextField2(
      {super.key,
      required this.textController,
      required this.hintText,
      this.maxLength,
      this.textType,
      });

  final TextEditingController textController;
  final String hintText;
  final int? maxLength;
  final TextInputType? textType;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(
          hintText: hintText,
          filled: true,
          hintStyle: const TextStyle(color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        keyboardType: textType,
        maxLength: maxLength,
      ),
    );
  }
}
