import 'package:flutter/material.dart';

class CustomTextfromfiled extends StatelessWidget {
  final double screenwidth;
  final TextEditingController controller;
  final String hintText;
  final Icon prefixicon;
  final bool isObscure;
  final String? Function(String?)? validator;
  const CustomTextfromfiled(
      {super.key,
      required this.controller,
      required this.isObscure,
      required this.hintText,
      required this.screenwidth,
      required this.prefixicon, required this.validator});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: screenwidth * 0.85,
      child: TextFormField(
        obscureText: isObscure,
        controller: controller,
        decoration: InputDecoration(
            fillColor: Colors.white,
            prefixIconColor: const Color(0XFF01AFFE),
            prefixIcon: prefixicon,
            filled: true,
            hintText: hintText,
            hintStyle: const TextStyle(color: Colors.grey),
            contentPadding: const EdgeInsets.symmetric(vertical: 20),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(12)
                
                ),
               
                ),
               
      ),
    );
  }
}
