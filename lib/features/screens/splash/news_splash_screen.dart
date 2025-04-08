import 'package:flutter/material.dart';
import 'package:newsly_app/features/screens/auth/login.dart';
import 'package:newsly_app/features/screens/home/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) {
            return LoginScreen();
          }), (route) => false);
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/news_splash_screen.gif',
              width: 400,
              height: 400,
              scale: 1,
              fit:BoxFit.fill,
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              'Welcome with \n News App',
              style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
