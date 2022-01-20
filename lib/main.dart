import 'package:cat_dog_classifier/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cats and Dogs',
      debugShowCheckedModeBanner: false,
      home: MySplash(),
    );
  }
}
