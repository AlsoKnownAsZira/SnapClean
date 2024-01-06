import 'package:flutter/material.dart';

class SnapTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;

  const SnapTextField(
      {super.key,
      required this.labelText,
      required this.controller,
      this.hintText = '...',
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          labelStyle: const TextStyle(color: Colors.black),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.shade700)),
          focusedBorder:
              const OutlineInputBorder(borderSide: BorderSide(color: Colors.green))),
    );
  }
}
