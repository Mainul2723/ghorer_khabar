// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:ghorer_bazar/views/login.dart';
import 'package:ghorer_bazar/views/main_view.dart';
import 'package:ghorer_bazar/views/signup.dart';
import 'package:ghorer_bazar/views/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/splash', // Set the initial route to SplashScreen
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/main': (context) =>
            const MainView(), // Replace with the actual route for your main view
        // Replace with the actual route for your signup view
      },
    );
  }
}
