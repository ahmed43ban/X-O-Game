import 'package:flutter/material.dart';

class Customtextfield extends StatelessWidget {
  String Player;
  TextEditingController controller;
  Customtextfield({super.key,required this.Player,required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white,
        filled: true,
        hintText: Player,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color:Colors.white,width: 0 ),
            borderRadius: BorderRadius.circular(20)
        ),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color:Colors.white,width: 0 ),
            borderRadius: BorderRadius.circular(20)
        ),
      ),
    );
  }
}
