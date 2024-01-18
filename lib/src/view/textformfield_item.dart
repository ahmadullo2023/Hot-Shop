import 'package:flutter/material.dart';


class ItemTextField extends StatelessWidget {
  const ItemTextField({
    super.key,
     this.textController,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });

  final TextEditingController? textController;
  final String hintText;
  final Widget prefixIcon;
  final Widget? suffixIcon;
  final dynamic validator;


  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(12),
      child: TextFormField(
        controller: textController,
        validator: validator,
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
  const ItemTextField2({
    super.key,
    required this.textController,
    required this.hintText,
  });
  final TextEditingController textController;
  final String hintText;

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
      ),
    );
  }
}