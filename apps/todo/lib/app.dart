import 'package:flutter/material.dart';
import 'package:todo/core/themes/themes.dart';
import 'package:todo/features/home/home_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.getTheme(),
      home: const HomeScreen(),
    );
  }
}
