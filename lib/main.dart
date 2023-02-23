import 'package:flutter/material.dart';
import 'package:money_manager/common/style/theme.dart';
import 'package:money_manager/screens/view/home/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme(),
      home: const HomeScreen()
    );
  }
}
