import 'package:flutter/material.dart';
import 'package:ghorer_bazar/views/login.dart';
import 'package:ghorer_bazar/views/signup.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  PageController controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        controller: controller,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Login(
              controller: controller,
            );
          } else {
            return SignUpScreen(
              controller: controller,
            );
          }
        },
      ),
    );
  }
}
