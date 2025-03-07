// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, non_constant_identifier_names, prefer_const_constructors, body_might_complete_normally_nullable
import 'package:flutter/material.dart';
class TextForm extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType kybord;
   Function(String?)? validat;
   void Function(String)?  onSav;
  final String hint;
  final Widget suffix;
  
  
  TextForm({
    required this.controller,
    required this.obscureText,
    required this.kybord,
    required this.hint,
  
   
     required this.onSav, required this.validat, required this.suffix,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: kybord,
      autofocus: true,
      validator: (value) => validat!(value),
     style: TextStyle(fontSize: 13,color:Colors.black),
      onFieldSubmitted: onSav,
      decoration: InputDecoration(
       
        suffixIcon: suffix,
        contentPadding: EdgeInsets.symmetric(horizontal: 4,vertical: 0),
        
        fillColor: Colors.white,
        
        hintText: hint,
        filled: true,
        
        labelStyle: TextStyle(fontSize: 10),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(25)),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(25)),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.green),
            borderRadius: BorderRadius.circular(25)),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(25)),
      ),
    );
  }
}
