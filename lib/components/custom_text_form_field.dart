import 'package:flutter/material.dart';

class CustomTextInputOutlineBorder extends StatelessWidget {
  const CustomTextInputOutlineBorder({
    Key? key,
    required this.label,
    required this.controller,
    required this.maxLength,
    required this.keyboardType,
    required this.textAlign,
    required this.validator,
  }) : super(key: key);

  final String label;
  final TextEditingController controller;
  final int maxLength;
  final TextInputType keyboardType;
  final TextAlign textAlign;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: TextFormField(
        controller: controller,
        maxLength: maxLength,
        keyboardType: keyboardType,
        textAlign: textAlign,
        validator: validator,
        style: const TextStyle(
          fontFamily: 'Lato',
          fontWeight: FontWeight.w400,
          fontSize: 17,
          letterSpacing: 1,
        ),
        decoration: InputDecoration(
          counterText: "",
          label: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Lato',
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
          ),
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.black54,
            ),
          ),
          contentPadding: const EdgeInsets.all(14),
        ),
      ),
    );
  }
}

class CustomTextFormFieldOBorderIcon extends StatelessWidget {
  const CustomTextFormFieldOBorderIcon({
    Key? key,
    required this.label,
    required this.suffixIcon,
    required this.controller,
    required this.obscureText,
    required this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final bool obscureText;
  final String label;
  final Widget suffixIcon;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        validator: validator,
        style: const TextStyle(
          fontFamily: 'Lato',
          fontWeight: FontWeight.w400,
          fontSize: 17,
        ),
        decoration: InputDecoration(
          label: Text(
            label,
            style: const TextStyle(
              fontFamily: 'Lato',
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
          ),
          suffixIcon: suffixIcon,
          isDense: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Colors.black54,
            ),
          ),
          contentPadding: const EdgeInsets.all(14),
        ),
      ),
    );
  }
}
