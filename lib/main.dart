import 'dart:io';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:newsly_app/features/screens/splash/news_splash_screen.dart';
import 'package:newsly_app/firebase_options.dart';



Future<void> main() async {
//  WebViewPlatform.instance != null;
//   if (WebViewPlatform.instance == null) {
//     if (Platform.isAndroid) {
//       WebViewPlatform.instance = AndroidWebViewPlatform();
//     } else if (Platform.isIOS) {
//       WebViewPlatform.instance = WebKitWebViewPlatform();
//     }
//   }
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform);
  runApp(const NewsApp());
}


class NewsApp extends StatefulWidget{
  const NewsApp({super.key});

  @override
  State<NewsApp> createState() => _NewsAppState();
}

class _NewsAppState extends State<NewsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home:SplashScreen() ,
      builder:EasyLoading.init(),
    );
  }
}
