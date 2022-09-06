import 'package:flutter/material.dart';
import 'package:video_streaming_app/presentation/skeleton.dart';

class MyApp extends StatelessWidget {
  MyApp._internal();

  static get instance => MyApp._internal();

  factory MyApp() => instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Color.fromARGB(255, 15, 2, 70)),
      home: Skeleton(),
    );
  }
}
