import 'package:flutter/material.dart';
import 'package:zubi/constants.dart';

class TextInputField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isObsecure;
  final IconData icon;
  final hintText;
  const TextInputField({
    Key? key,
    required this.controller,
    required this.labelText,
    this.isObsecure = false,
    this.hintText ="",
    required this.icon,
    required TextStyle textStyle,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        prefixIcon: Icon(icon),
        labelStyle: const TextStyle(fontSize: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: borderColor,
          ),
        ),
        focusedBorder:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: const BorderSide(
            color: borderColor,
    )
        )
      ),
      obscureText: isObsecure,
    );
  }
}
