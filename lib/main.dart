import 'package:flutter/material.dart';
import 'package:netzero/pages/splash_screen.dart';
import 'package:netzero/routes/route_generator.dart';
import 'package:netzero/util/color_constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      title: 'Splash Screen',
      home: SplashScreen(),
      initialRoute: '/',
      onGenerateRoute: RouteGenerator.generateRoute,
      debugShowCheckedModeBanner: false,
    );
  }

}
