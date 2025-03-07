// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, non_constant_identifier_names, prefer_const_constructors, body_might_complete_normally_nullable
import 'package:flutter/material.dart';
class TextForm extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final TextInputType kybord;
  final Widget prefix;
  Function(String?)? validat;
 void Function(String)? onSav;
  final String hint;
  
  
  TextForm({
    required this.controller,
    required this.obscureText,
    required this.kybord,
    required this.hint,
    required this.prefix,
  
   
     required this.onSav,
      required this.validat,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: controller,
      
        obscureText: obscureText,
        keyboardType: kybord,
        validator: (value) => validat!(value),
       style: TextStyle(fontSize: 13,color:Colors.black),
        // onChanged: onSav,
        onFieldSubmitted: onSav,
        
        decoration: InputDecoration(
         
           prefixIcon: prefix,
          contentPadding: EdgeInsets.symmetric(horizontal: 8),
          
          fillColor: Colors.grey.withOpacity(0.1),
          
          hintText: hint,
          filled: true,
          
          labelStyle: TextStyle(fontSize: 10),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.green),
              borderRadius: BorderRadius.circular(10)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
