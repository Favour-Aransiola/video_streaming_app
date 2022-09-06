import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_streaming_app/app/app.dart';
import 'package:video_streaming_app/app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await intialize();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 15, 2, 70),
      statusBarBrightness: Brightness.dark,
      systemNavigationBarDividerColor: Colors.purple,
      statusBarIconBrightness: Brightness.dark));
  runApp(MyApp());
}
