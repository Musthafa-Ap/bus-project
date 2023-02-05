import 'package:flutter/material.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool isObscure;
  final String hintText;
  final TextInputType? keyboardType;
  const CommonTextField(
      {super.key,
      this.keyboardType,
      required this.hintText,
      this.isObscure = false,
      this.controller,
      this.validator});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      obscureText: isObscure,
      textAlign: TextAlign.center,
      cursorColor: Colors.black,
      decoration: InputDecoration(
          hintText: hintText,
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.transparent),
            borderRadius: BorderRadius.circular(10.0),
          ),
          filled: true,
          fillColor: const Color.fromRGBO(42, 42, 42, 0.1)),
      validator: validator,
    );
  }
}
