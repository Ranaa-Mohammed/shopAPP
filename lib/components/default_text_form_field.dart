import 'package:flutter/material.dart';

class DefaultTextFormField extends StatelessWidget {
   DefaultTextFormField({super.key, this.label, this.obscureText = false, this.onChanged, this.prefixIcon, this.suffixIcon,
     this.keyboardType, this.validator, this.controller, this.onFieldSubmitted, this.suffix,
   });
   ValueChanged? onFieldSubmitted;
  String? label;
  ValueChanged? onChanged;
   bool obscureText = false;
  Icon? prefixIcon;
  IconButton? suffixIcon;
  dynamic? keyboardType;
   FormFieldValidator<String>? validator;
   TextEditingController? controller;
   Icon? suffix;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0,),
        ),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        suffix: suffix,
        hintText: label,
      ),
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
      obscureText: obscureText,

    );
  }
}
