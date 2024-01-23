import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.prefixIcon,
    required this.labelText,
    required this.padding,
    required this.isPassword,
  });
  final Widget prefixIcon;
  final String labelText;
  final EdgeInsets padding;
  final TextEditingController controller;
  final bool isPassword;
// EdgeInsets.only(top: 20, right: 20, left: 20)
// Icon(Icons.movie)
// "Name"
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: TextField(
        obscureText: isPassword,
        controller: controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 5),
            child: prefixIcon,
          ),
          prefixIconColor: Colors.grey,
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
