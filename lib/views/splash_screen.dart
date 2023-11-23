import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _logoSlideAnimation;
  late Animation<Offset> _textSlideAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _logoSlideAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0), // Off-screen top
      end: const Offset(0.0, 0.0), // Center
    ).animate(_animationController);

    _textSlideAnimation = Tween<Offset>(
      begin: const Offset(0.0, 1.0), // Off-screen bottom
      end: const Offset(0.0, 0.0), // Center
    ).animate(_animationController);

    _animationController.forward();

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // After the animation completes, navigate to the next screen (e.g., login or home screen).
        Navigator.pushReplacementNamed(context, '/main');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SlideTransition(
              position: _logoSlideAnimation,
              child: Image.asset(
                'assets/logo.png',
                width: 150,
                height: 150,
              ),
            ),
            const SizedBox(height: 20),
            SlideTransition(
              position: _textSlideAnimation,
              child: const Text(
                'Ghorer Khabar',
                style: TextStyle(
                  fontSize: 30,
                  fontFamily: 'Splash',
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
