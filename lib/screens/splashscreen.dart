import 'package:ecommerce_app/screens/validations/signup.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void nextpage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const Signuppage()));
  }

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), nextpage);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
                child: Lottie.asset("animation/ecommerce_Splash.json",
                    width: 300)),
            const Text(
              "E-Commerce",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
