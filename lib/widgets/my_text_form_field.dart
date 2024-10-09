import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatelessWidget {
  final TextEditingController controllers;
  final String? hintText;
  final String? labelText;
  final IconData? suffixIconData;
  final TextInputType? keyboardType;
  final AutovalidateMode? autovalidateMode;
  final int? inputLength;
  const MyTextFormField(
      {super.key,
      required this.controllers,
      this.hintText,
      this.labelText,
      this.keyboardType,
      this.suffixIconData,
      this.inputLength,
      this.autovalidateMode});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controllers,
        keyboardType:
            (keyboardType == null) ? TextInputType.text : keyboardType,
        decoration: InputDecoration(
          labelText: labelText,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: const TextStyle(
              color: Colors.black54, fontWeight: FontWeight.w500),
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Colors.black12,
          ),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter the $hintText';
          }
          return null;
        },
        autovalidateMode:
            autovalidateMode ?? AutovalidateMode.onUserInteraction,
        inputFormatters: [
          LengthLimitingTextInputFormatter(inputLength??20),
        ],
      ),
    );
  }
}
