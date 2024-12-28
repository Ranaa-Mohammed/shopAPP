import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
   DefaultButton({super.key, this.onPressed, this.text});
     String? text;
   Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
           color: Colors.indigo,
        ),
      child: IconButton(
          onPressed: onPressed,
          icon: Text(
              text!,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
      ),
    );
  }
}
//Text('LOGIN')