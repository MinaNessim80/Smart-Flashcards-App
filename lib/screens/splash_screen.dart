import 'package:flutter/material.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  final Color lightPurple = Color(0xFF7267E3); // بنفسجي فاتح
  final Color whiteColor = Color(0xFFFEFFFE); // أبيض

  @override
  void initState() {
    super.initState();

    // إعداد الأنيميشن
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _controller.forward();

    // الانتقال للصفحة الرئيسية بعد 2 ثانية
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightPurple,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Text(
            'Smart Flashcards',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: whiteColor,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}