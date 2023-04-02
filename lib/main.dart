import 'package:arrk_1/constants/constant_strings.dart';
import 'package:arrk_1/views/pages/home_page.dart';
import 'package:flutter/material.dart';



void main() {
runApp(const MyApp()); //runApp da startul aplicatiei
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: ConstantStrings.title,
      home: HomePage(),
      debugShowCheckedModeBanner: false, // dezactivam eticheta de debug
    );
  }
}
