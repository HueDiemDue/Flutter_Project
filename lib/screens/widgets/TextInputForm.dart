import 'package:flutter/material.dart';

class TextInputForm extends StatelessWidget {
  const TextInputForm({
    Key? key,
    required this.hintText,
    this.validator,
    this.maxLength = 255,
    this.keyboardType,
    this.obscureText = false,
  }) : super(key: key);

  final String hintText;
  final dynamic validator;
  final int maxLength;
  final TextInputType? keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return (TextFormField(
      maxLength: maxLength,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: Color(0xffd5d1d2)),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffd5d1d2)),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        counterText: '',
      ),
      cursorColor: Colors.white,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
    ));
  }
}
