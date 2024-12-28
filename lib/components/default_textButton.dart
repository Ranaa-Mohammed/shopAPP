import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
   DefaultTextButton({super.key, this.onPressed, this.text,
   });

  Function()? onPressed;
  String? text;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text!),
    );
  }
}
