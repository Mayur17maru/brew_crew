import 'package:flutter/material.dart';
 InputDecoration textInputDecoration=InputDecoration(
  hintText: 'Email',
  fillColor: Colors.white,
  filled: true,
  enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(21),
      borderSide:BorderSide( color: Colors.pinkAccent)
  ),
  focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(21),
      borderSide:BorderSide( color: Colors.greenAccent)
  ),
);